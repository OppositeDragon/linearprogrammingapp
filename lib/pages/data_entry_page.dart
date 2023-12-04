import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linearprogrammingapp/controllers/data_entry_controller.dart';
import 'package:linearprogrammingapp/widgets/entry_size_widget.dart';

import '../constants/numeric.dart';
import '../widgets/data_entry_widget.dart';

class DataEntryPage extends ConsumerStatefulWidget {
  const DataEntryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DataEntryPageState();
}

class _DataEntryPageState extends ConsumerState<DataEntryPage> {
  late final PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(keepPage: true);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(entryPageControllerProvider, (previous, next) {
      pageController.animateToPage(
        next,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    });
    final entryPage = ref.watch(entryPageControllerProvider);
    Object? _ = ref.watch(entrySizeControllerProvider);
    _ = ref.watch(processTypeControllerProvider);
    _ = ref.watch(dataEntryControllerProvider);
    return PopScope(
      canPop: entryPage == 0,
      onPopInvoked: (didPop) {
        if (didPop) return;
        ref.read(entryPageControllerProvider.notifier).updatePage(0);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Linear Programming App'),
          centerTitle: true,
          actions: [
            if (ref.watch(entryPageControllerProvider) > 0)
              IconButton(
                onPressed: () => ref.invalidate(dataEntryControllerProvider),
                icon: const Icon(Icons.backspace),
                tooltip: 'Clear all fields',
              )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: spaceL),
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: const [
              EntrySizeWidget(),
              DataEntryWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
