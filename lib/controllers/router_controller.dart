import 'package:go_router/go_router.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../pages/home_page.dart';
import '../pages/login_page.dart';

part 'router_controller.g.dart';

@riverpod
Raw<GoRouter> goRouter(GoRouterRef ref) {
  final router = GoRouter(
    // redirect: (context, state) async {
    //   User? user;
    //   try {
    //     user = await ref.watch(accountProvider).get();
    //   } catch (e) {
    //     user = null;
    //   }
    //   final isLoggedIn = user != null;
    //   debugPrint('isLoggedIn: $isLoggedIn, user: ${user?.email}');
    //   // if (!isLoggedIn && (state.location == '/' || state.location == '/settings')) {
    //   //   return '/login';
    //   // }
    //   if (isLoggedIn && state.location == '/login') {
    //     return '/';
    //   }
    //   return null;
    // },
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
