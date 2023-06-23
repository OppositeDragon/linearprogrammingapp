import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;
    return FilledButton.icon(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.all(0),
        elevation: 4,
        shadowColor: const Color.fromRGBO(0, 0, 0, 1),
        backgroundColor: isDark ? const Color(0xFF4285F4) : const Color(0xFFFFFFFF),
        textStyle: const TextStyle(fontFamily: 'Roboto-Medium', fontSize: 16),
        foregroundColor: isDark ? const Color(0xFFFFFFFF) : const Color.fromRGBO(106, 106, 106, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      ),
      icon: Padding(
        padding: const EdgeInsets.all(4.0),
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(3)),
          child: SizedBox.square(
            dimension: 56,
            child: Center(
              child: Image.asset('assets/img/g-logo.png', width: 32, height: 32),
            ),
          ),
        ),
      ),
      label: const Text(' Sign in with Google  '),
    );
  }
}
