import 'package:flutter/material.dart';

class FinalCostCalculation extends StatelessWidget {
  const new({
    super.key,
    required this.style,
    required this.theme,
    required this.toCalculate,
  });

  final TextStyle style;
  final ThemeData theme;
  final ValueGetter<double> toCalculate;

  @override
  Widget build(BuildContext context) {
    return Text(
      '£${toCalculate().toStringAsFixed(2)} ',
      style: style.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: theme.textTheme.displaySmall?.fontSize,
      ),
    );
  }
}