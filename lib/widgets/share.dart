import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/routes.dart';
import '../constants/strings.dart';
import '../controllers/data_entry_controller.dart';

class ShareWidget extends ConsumerWidget {
  const ShareWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return IconButton(
      tooltip: 'Compartir',
      icon: const Icon(Icons.share_outlined),
      onPressed: () async {
        try {
          const String path = '/$routeDataEntry';
          final String query = jsonEncode(ref.read(dataEntryControllerProvider).toJson());
          final uri = Uri.https(authority, path, {'data': query});
          await Clipboard.setData(ClipboardData(text: '$uri'));
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Enlace copiado al portapapeles.'),
              ),
            );
          }
        } catch (e) {
          debugPrint(e.toString());
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Ha ocurrido un error al intentar compartir',
                  style: textTheme.bodyMedium?.copyWith(color: colorScheme.error),
                ),
                backgroundColor: colorScheme.errorContainer,
              ),
            );
          }
        }
      },
    );
  }
}
