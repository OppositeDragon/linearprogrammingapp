import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:linear_programming_app/pages/home_page.dart';
import 'package:linear_programming_app/pages/login_page.dart';
import 'package:linear_programming_app/services/authentication_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_controller.g.dart';

@riverpod
Raw<GoRouter> goRouter(GoRouterRef ref) {
  final router = GoRouter(
    redirect: (context, state) async {
      User? user;
      try {
        user = await ref.watch(accountProvider).get();
      } catch (e) {
        user = null;
      }
      final isLoggedIn = user != null;
      debugPrint('isLoggedIn: $isLoggedIn, user: ${user?.email}');
      if (!isLoggedIn && (state.location == '/' || state.location == '/settings')) {
        return '/login';
      }
      if (isLoggedIn && state.location == '/login') {
        return '/';
      }
      return null;
    },
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
}
