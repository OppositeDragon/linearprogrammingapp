import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
  void build() async {
  }

  Future<void> createEmailAndPasswordAccount(String email, String password) async {
    final user = await ref.read(accountProvider).create(userId: ID.unique(), email: email, password: password);
    debugPrint('user: ${user.email}');
  }

  Future<void> logInEmailAndPassword(String email, String password) async {
    final session = await ref.read(accountProvider).createEmailSession(email: email, password: password);
    debugPrint('session: ${session.userId}');
  }

  Future<void> logOut() async {
    await ref.read(accountProvider).deleteSession(sessionId: 'current');
  }

  Future<void> signInWithGoogle() async {
    try {
      final account = ref.read(accountProvider);
      final result = await account.createOAuth2Session(
        provider: 'google',
      );
      debugPrint('result:$result');
      final accountAfter = await account.get();
      debugPrint('google account: ${accountAfter.email}');
    } catch (e) {
      debugPrint('error: $e');
    }
  }
}
