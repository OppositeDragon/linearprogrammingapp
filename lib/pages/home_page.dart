import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linearprogrammingapp/controllers/router_controller.dart';

import '../constants/numeric.dart';
import '../constants/routes.dart';
import '../controllers/login_controller.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Linear Programming App'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(loginControllerProvider.notifier).logOut(),
          ),
        ],
      ),
      body: Center(
        child: FilledButton.tonal(
          onPressed: () => ref.read(goRouterProvider).goNamed(routeDataEntryName),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Iniciar'),
              SizedBox(width: spaceL),
              Icon(Icons.arrow_forward_rounded, size: spaceXXL),
            ],
          ),
        ),
      ),
    );
  }
}
