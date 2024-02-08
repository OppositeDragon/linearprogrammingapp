import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:linearprogrammingapp/constants/numeric.dart';

class MathTexAlgebraic extends StatelessWidget {
  const MathTexAlgebraic({
    super.key,
    required this.equation,
    this.eqStyle = const TextStyle(),
    this.center = true,
  });

  final TextStyle eqStyle;
  final String equation;
  final bool center;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spaceS),
      child: SizedBox(
        height: 25,
        child: center
            ? Center(
                child: Math.tex(equation, textStyle: eqStyle),
              )
            : Math.tex(equation, textStyle: eqStyle),
      ),
    );
  }
}
