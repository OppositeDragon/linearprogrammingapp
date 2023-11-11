import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linearprogrammingapp/constants/numeric.dart';

import '../controllers/login_controller.dart';
import '../widgets/data_size_entry.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    showDataEntryDialog() => showDialog(
          context: context,
          builder: (context) => const Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(spaceXL))),
            child: DataSizeEntryWidget(),
          ),
        );

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
          onPressed: showDataEntryDialog,
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
