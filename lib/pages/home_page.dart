import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/numeric.dart';
import '../constants/routes.dart';
import '../constants/strings.dart';
import '../controllers/home_page_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/router_controller.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showDownloads = ref.watch(showDownloadsProvider);
    final downloadsNotifier = ref.read(showDownloadsProvider.notifier);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Cerrar sesión',
            onPressed: () => ref.read(loginControllerProvider.notifier).logOut(),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              // 1  Center
              child: FilledButton.tonal(
                autofocus: true,
                onPressed: () => ref.read(goRouterProvider).goNamed(routeDataEntryName),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: spaceL),
                    Text(
                      'Iniciar',
                      style: textTheme.titleMedium,
                    ),
                    const SizedBox(
                      width: spaceXXL,
                      height: spaceXXL * 2,
                    ),
                    const Icon(Icons.arrow_forward_rounded, size: spaceXXXL),
                    const SizedBox(width: spaceL),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            child: AnimatedCrossFade(
                firstChild: Padding(
                  padding: const EdgeInsets.symmetric(vertical: spaceL),
                  child: SizedBox(
                    width: downloadButtonWidth + 25,
                    child: FilledButton(
                      autofocus: true,
                      onPressed: () => downloadsNotifier.toggleDownloads(),
                      child: const Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Descargar aplicación'),
                          Icon(Icons.download, size: spaceXXXL),
                        ],
                      ),
                    ),
                  ),
                ),
                secondChild: const DownloadButtons(),
                crossFadeState: showDownloads ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 350)),
          )
        ],
      ),
    );
  }
}

class DownloadButtons extends ConsumerWidget {
  const DownloadButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final downloadsNotifier = ref.read(showDownloadsProvider.notifier);
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        const SizedBox(height: spaceL),
        SizedBox(
          width: downloadButtonWidth,
          child: FilledButton.tonal(
            autofocus: true,
            onPressed: () async => await launchUrl(
              Uri.https('github.com', '/OppositeDragon/linearprogrammingapp/releases'),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Descarga directa',
                  style: textTheme.titleMedium,
                ),
                const Icon(Icons.download_for_offline_outlined, size: spaceXXXL),
              ],
            ),
          ),
        ),
        const SizedBox(height: spaceL),
        InkWell(
          onTap: () async => await launchUrl(
            Uri.https(
              'play.google.com',
              '/store/apps/details',
              {'id': 'app.oppositedragon.linearprogrammingapp'},
            ),
          ),
          child: Image.asset(
            'assets/img/google-play-badge.png',
            width: downloadButtonWidth,
            fit: BoxFit.contain,
            semanticLabel: 'Descarga la aplicación desde Google Play',
          ),
        ),
        const SizedBox(height: spaceL),
        InkWell(
          onTap: () async => await launchUrl(
            Uri.https('apps.microsoft.com', '/detail/9N83JQZ260X6'),
          ),
          child: Image.asset(
            'assets/img/microsoft-badge.png',
            width: downloadButtonWidth,
            fit: BoxFit.contain,
            semanticLabel: 'Descarga la aplicación desde la tienda de Microsoft',
          ),
        ),
        const SizedBox(height: spaceL),
        SizedBox(
          width: downloadButtonWidth,
          child: TextButton(
            onPressed: () => downloadsNotifier.toggleDownloads(),
            child: const Text(
              'ocultar',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: spaceL),
      ],
    );
  }
}
