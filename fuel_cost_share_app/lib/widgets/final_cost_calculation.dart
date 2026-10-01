import 'package:flutter/material.dart';

// Shows the final cost each traveller pays (fuel + tip, split evenly),
// formatted as pounds with 2 decimals
class FinalCostCalculation extends StatelessWidget {
  const new({
    super.key,
    required this.style,
    required this.theme,
    required this.toCalculate,
  });

  final TextStyle style;
  final ThemeData theme;

  // Function from the parent that returns the cost per traveller
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
