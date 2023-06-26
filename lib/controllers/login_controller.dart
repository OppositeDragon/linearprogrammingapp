import 'package:appwrite/appwrite.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linearprogrammingapp/models/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/authentication_service.dart';
import 'db_controller.dart';

part 'login_controller.freezed.dart';
part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  LoginState build() {
    return const LoginState();
  }

  void toggleVisibility() {
    state = state.copyWith(isVisible: !state.isVisible);
  }

  void toggleLogin() {
    state = state.copyWith(isLogin: !state.isLogin);
  }

  Future<void> authenticate(AuthenticationMethod method, [String? name, String? email, String? password]) async {
    state = state.copyWith(
      isLoading: true,
      authenticationMethod: method,
      name: name ?? '',
      email: email ?? '',
      password: password ?? '',
    );
    try {
      if (state.isLogin) {
        await logIn();
      } else {
        await createAccount();
      }
    } on AppwriteException catch (e) {
      switch (e.type) {
        case 'user_already_exists':
          debugPrint('catched: $e');
          state = state.copyWith(
              exception: const LoginException('Ya existe una cuenta con ese correo, intente iniciar sesion.'));
          break;
        case 'general_argument_invalid':
          debugPrint('catched: $e');
          state = state.copyWith(
              exception: const LoginException(
                  'Asegurese de proveer una direccion de correo electronico valido, y una clave valida de por lo menos 8 caracteres. Intente de nuevo.'));
          break;
        case 'user_invalid_credentials':
          debugPrint('catched: $e');
          state = state.copyWith(exception: const LoginException('Credenciales invalidas, intente de nuevo. '));
          break;
        default:
          debugPrint('default: $e');
          state = state.copyWith(exception: const LoginException('Error de backend.'));
          break;
      }
    } catch (e) {
      debugPrint('other exception: $e');
      state = state.copyWith(exception: const LoginException('Error.'));
    } finally {
      state = state.copyWith(isLoading: false, exception: null);
    }
  }

  Future<void> createAccount() async {
    switch (state.authenticationMethod) {
      case AuthenticationMethod.emailAndPassword:
        await createEmailAndPasswordAccount();
        break;
      default:
        throw UnimplementedError();
    }
    logIn();
  }

  Future<void> logIn() async {
    switch (state.authenticationMethod) {
      case AuthenticationMethod.emailAndPassword:
        await logInEmailAndPassword();
      case AuthenticationMethod.google:
        await signInWithGoogle();
        break;
      case AuthenticationMethod.guest:
        signInAsGuest();
        break;
      default:
        throw UnimplementedError();
    }
    await Future.delayed(const Duration(milliseconds: 500), () {});
    UserModel user = await getAccount();
    final loginBox = ref.read(dbLoginProvider);
    loginBox.put(userKey, user.toJson());
    debugPrint('user: ${user.toString()}');
  }

  Future<void> signInWithGoogle() async {
    await ref.read(authenticationServiceProvider.notifier).signInWithGoogle();
  }

  Future<void> createEmailAndPasswordAccount() async {
    await ref
        .read(authenticationServiceProvider.notifier)
        .createEmailAndPasswordAccount(state.name, state.email, state.password);
  }

  Future<void> logInEmailAndPassword() async {
    await ref.read(authenticationServiceProvider.notifier).logInEmailAndPassword(
          state.email,
          state.password,
        );
  }

  Future<UserModel> getAccount() async {
    if (AuthenticationMethod.guest == state.authenticationMethod) return signInAsGuest();
    return await ref.read(authenticationServiceProvider.notifier).getAccount();
  }

  Future<void> logOut() async {
    try {
      final loginBox = ref.read(dbLoginProvider);
      await loginBox.deleteAll([userKey]);
      await ref.read(authenticationServiceProvider.notifier).logOut();
      state = const LoginState();
    } on AppwriteException catch (e) {
      debugPrint('logout: $e');
    }
  }

  UserModel signInAsGuest() {
    return const UserModel(id: 'guest', name: 'Invitado', email: '');
  }
}

enum AuthenticationMethod {
  emailAndPassword,
  google,
  guest;
}

@freezed
class LoginState with _$LoginState {
  const LoginState._();
  const factory LoginState({
    @Default(false) bool isLoading,
    @Default(false) bool isVisible,
    @Default(true) bool isLogin,
    @Default('') String name,
    @Default('') String email,
    @Default('') String password,
    @Default(AuthenticationMethod.emailAndPassword) AuthenticationMethod authenticationMethod,
    LoginException? exception,
  }) = _LoginState;
}

class LoginException implements Exception {
  const LoginException(this.message);
  final String message;
}
