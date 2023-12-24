import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/numeric.dart';
import '../constants/routes.dart';

class GoBackGoHomeButtons extends StatelessWidget {
  const GoBackGoHomeButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        FilledButton(
          onPressed: context.pop,
          child: const Text('Regresar'),
        ),
        const SizedBox(width: spaceXL),
        OutlinedButton(
          onPressed: () => context.goNamed(routeHomeName),
          child: const Text('Ir a inicio'),
        ),
        const Spacer(),
      ],
    );
  }
}
