import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:linearprogrammingapp/pages/data_entry_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../pages/home_page.dart';
import '../pages/login_page.dart';
import 'db_controller.dart';

part 'router_controller.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final router = GoRouter(
    refreshListenable: ref.read(dbLoginProvider).listenable(keys: [
      userKey,
    ]),
    redirect: (context, state) async {
      final loginBox = ref.read(dbLoginProvider);
      final bool isLoggedIn = loginBox.get(userKey) != null;
      if (!isLoggedIn && state.location != '/login') {
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
        routes: [
          GoRoute(
            path: 'data-entry',
            name: 'data-entry',
            builder: (context, state) => const DataEntryPage(),
          ),
        ],
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
}
