import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SimplexProcessPage extends ConsumerWidget {
  const SimplexProcessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Linear Programming App'),
          centerTitle: true,
        ),
        body: const Center(child: Text('SimplexProcessPage')));
  }
}
