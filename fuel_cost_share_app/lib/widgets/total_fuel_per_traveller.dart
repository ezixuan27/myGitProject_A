import 'package:flutter/material.dart';

// Top section: the "Total Fuel Cost Per Traveller" heading and the amount
// each traveller pays (fuel + tip, split evenly) in pounds with 2 decimals
class TotalFuelPerTraveller extends StatelessWidget {
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
    return Column(
      children: [
        Text('Total Fuel Cost Per Traveller', style: style),
        Text(
          '£${toCalculate().toStringAsFixed(2)} ',
          style: style.copyWith(
            color: theme.colorScheme.onPrimary,
            fontSize: theme.textTheme.displaySmall?.fontSize,
          ),
        ),
      ],
    );
  }
}
