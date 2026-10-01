import 'package:flutter/material.dart';

// Shows the tip amount in money to 2 decimals
class TipAmountDisplay extends StatelessWidget {
  const new({
    super.key,
    required this.fuelCost,
    required this._giftPercentage,
    required this.theme,
  });

  final double fuelCost;
  // Tip as a fraction, 0.1-0.5
  final double _giftPercentage;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Text(
      (fuelCost * _giftPercentage).toStringAsFixed(2),
      style: theme.textTheme.titleMedium,
    );
  }
}
