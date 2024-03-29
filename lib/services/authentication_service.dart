import 'package:appwrite/appwrite.dart';
import 'package:flutter/foundation.dart';
import 'package:linearprogrammingapp/models/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:window_location_href/window_location_href.dart';

part 'authentication_service.g.dart';

@riverpod
Client client(ClientRef ref) {
  return Client().setEndpoint('https://cloud.appwrite.io/v1').setProject('linearprogrammingapp');
}

@riverpod
Account account(AccountRef ref) {
  final client = ref.watch(clientProvider);
  return Account(client);
}

@riverpod
class AuthenticationService extends _$AuthenticationService {
  @override
  void build() async {}

  Future<void> createEmailAndPasswordAccount(String name, String email, String password) async {
    final account = ref.read(accountProvider);
    final user = await account.create(
      userId: ID.unique(),
      name: name,
      email: email,
      password: password,
    );
    debugPrint('user: ${user.email}');
  }

  Future<void> logInEmailAndPassword(
    String email,
    String password,
  ) async {
    final account = ref.read(accountProvider);
    final session = await account.createEmailSession(
      email: email,
      password: password,
    );
    debugPrint('session: ${session.userId}');
  }

  Future<void> logOut() async {
    await ref.read(accountProvider).deleteSession(sessionId: 'current');
  }

  Future<void> signInWithGoogle() async {
    final account = ref.read(accountProvider);
    final result = await account.createOAuth2Session(
      provider: 'google',
      success: _successCallback(),
      failure: _failureCallback(),
    );
    debugPrint('google siginresult: $result');
  }

  Future<UserModel> getAccount() async {
    final account = ref.read(accountProvider);
    final userAccount = await account.get();
    return UserModel(id: userAccount.$id, email: userAccount.email, name: userAccount.name);
  }

  String? _successCallback() {
    if (kIsWeb) {
      final Uri? location = href == null ? null : Uri.parse(href!);
      return '${location?.origin}/auth.html';
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return null;
      case TargetPlatform.fuchsia:
        return null;
      case TargetPlatform.iOS:
        return null;
      case TargetPlatform.macOS:
        return null;
      case TargetPlatform.linux || TargetPlatform.windows:
        return 'http://localhost:1001/auth/oauth2/success';
      default:
        throw UnsupportedError('Unsupported platform');
    }
  }

  String? _failureCallback() {
    switch (defaultTargetPlatform) {
      default:
        return 'http://localhost:1001/auth/oauth2/failure';
    }
  }
}
