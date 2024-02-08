import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../constants/numeric.dart';
import '../constants/strings.dart';
import '../controllers/data_entry_controller.dart';
import '../controllers/upload_controller.dart';
import '../widgets/data_entry_widget.dart';
import '../widgets/entry_size_widget.dart';

class DataEntryPage extends ConsumerStatefulWidget {
  const DataEntryPage(this.data, {super.key});
  final String? data;

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
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.data != null) {
      try {
        ref.read(uploadControllerProvider.notifier).operateOnContent(widget.data!);
      } catch (e) {
        final TextTheme textTheme = Theme.of(context).textTheme;
        final ColorScheme colorScheme = Theme.of(context).colorScheme;
        SchedulerBinding.instance.addPostFrameCallback(
          (timestamp) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Ha ocurrido un error al cargar los datos embebidos en el enlace.',
                style: textTheme.bodyMedium?.copyWith(color: colorScheme.error),
              ),
              backgroundColor: colorScheme.errorContainer,
            ),
          ),
        );
        debugPrint(e.toString());
      }
    }
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
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return PopScope(
      canPop: entryPage == 0,
      onPopInvoked: (didPop) {
        if (didPop) return;
        ref.read(entryPageControllerProvider.notifier).updatePage(0);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(title),
          centerTitle: true,
          actions: [
            if (entryPage == 0)
              IconButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) {
                    return Consumer(
                      builder: (context, ref, child) {
                        final uploadState = ref.watch(uploadControllerProvider);
                        final uploadController = ref.read(uploadControllerProvider.notifier);
                        return AlertDialog(
                          insetPadding: const EdgeInsets.symmetric(horizontal: spaceXXXL, vertical: spaceXXL),
                          title: const Text('Carga de datos del problema'),
                          content: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 550),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (uploadState.showHelpMessage)
                                    const Text(
                                      uploadHelpMessage1,
                                      textAlign: TextAlign.justify,
                                    ),
                                  if (uploadState.showHelpMessage)
                                    SelectableText(
                                      uploadDataHelpMessage,
                                      style: textTheme.bodyMedium?.copyWith(fontFamily: 'MonaspaceXenon'),
                                    ),
                                  if (uploadState.showHelpMessage)
                                    const Text(
                                      uploadHelpMessage2,
                                      textAlign: TextAlign.justify,
                                    ),
                                  if (uploadState.showHelpMessage) const SizedBox(height: spaceM),
                                  if (uploadState.showHelpMessage)
                                    Image.asset(
                                      'assets/img/file_upload_help.png',
                                      width: 320,
                                      fit: BoxFit.contain,
                                      semanticLabel: 'Imagen que muestra el resultado del bloque JSON',
                                    ),
                                ],
                              ),
                            ),
                          ),
                          actions: [
                            FilledButton.icon(
                                onPressed: () async {
                                  final FilePickerResult? result = await FilePicker.platform.pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: ['json', 'txt'],
                                  );
                                  if (result != null) {
                                    late final String jsonContent;
                                    if (kIsWeb) {
                                      Uint8List fileBytes = result.files.first.bytes!;
                                      jsonContent = String.fromCharCodes(fileBytes);
                                    } else {
                                      final File file = File(result.files.single.path!);
                                      jsonContent = await file.readAsString();
                                    }
                                    debugPrint(jsonContent);
                                    try {
                                      uploadController.operateOnContent(jsonContent);
                                      if (mounted) context.pop();
                                    } catch (e) {
                                      debugPrint(e.toString());
                                      if (mounted) {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: const Text('Ha ocurrido un error'),
                                            backgroundColor: colorScheme.errorContainer,
                                            content: ConstrainedBox(
                                                constraints: const BoxConstraints(maxWidth: 450),
                                                child: Text(e.toString())),
                                            actions: [
                                              ElevatedButton(
                                                onPressed: context.pop,
                                                child: const Text('Aceptar'),
                                              ),
                                            ],
                                          ),
                                        );
                                        uploadController.toggleHelpMessage(true);
                                      }
                                    }
                                  }
                                },
                                icon: const Icon(Icons.upload_file_rounded),
                                label: const Text('Seleccionar archivo')),
                            IconButton.filledTonal(
                              onPressed: uploadController.toggleHelpMessage,
                              icon: const Icon(Icons.help),
                            )
                          ],
                        );
                      },
                    );
                  },
                ),
                icon: const Icon(Icons.upload_file_rounded),
                tooltip: 'Cargar datos del problema, como un archivo en formato json.',
              ),
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
