import 'package:appwrite/appwrite.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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

  Future<({String id, String email, String name})?> authenticate(AuthenticationMethod method,
      [String? email, String? password]) async {
    ({String id, String email, String name})? user;
    state = state.copyWith(isLoading: true, authenticationMethod: method, email: email ?? '', password: password ?? '');
    try {
      if (state.isLogin) {
        await logIn();
      } else {
        await createAccount();
      }
      await Future.delayed(const Duration(milliseconds: 500), () {});
      user = await getAccount();
      final loginBox = ref.read(dbLoginProvider);
      loginBox.put(userKey, user);
    } on AppwriteException catch (e) {
      state = state.copyWith(isLoggedIn: false);
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
      state = state.copyWith(exception: const LoginException('Error.'), isLoggedIn: false);
    } finally {
      state = state.copyWith(isLoading: false, exception: null);
    }
    return user;
  }

  Future<void> createAccount() async {
    switch (state.authenticationMethod) {
      case AuthenticationMethod.emailAndPassword:
        await createEmailAndPasswordAccount();
        break;
      default:
        throw UnimplementedError();
    }
  }

  Future<void> logIn() async {
    switch (state.authenticationMethod) {
      case AuthenticationMethod.emailAndPassword:
        await logInEmailAndPassword();
      case AuthenticationMethod.google:
        await signInWithGoogle();
        break;
      case AuthenticationMethod.guest:
        await signInAsGuest();
        break;
      default:
        throw UnimplementedError();
    }
  }

  Future<void> signInWithGoogle() async {
    await ref.read(authenticationServiceProvider.notifier).signInWithGoogle();
  }

  Future<void> createEmailAndPasswordAccount() async {
    await ref.read(authenticationServiceProvider.notifier).createEmailAndPasswordAccount(state.email, state.password);
  }

  Future<void> logInEmailAndPassword() async {
    await ref.read(authenticationServiceProvider.notifier).logInEmailAndPassword(state.email, state.password);
  }

  Future<({String id, String email, String name})> getAccount() async {
    return await ref.read(authenticationServiceProvider.notifier).getAccount();
  }

  Future<void> logOut() async {
    await ref.read(authenticationServiceProvider.notifier).logOut();
    final loginBox = ref.read(dbLoginProvider);
    loginBox.deleteAll([userKey]);
    state = const LoginState();
  }

  signInAsGuest() {
    return;
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
    @Default(false) bool isLoggedIn,
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
