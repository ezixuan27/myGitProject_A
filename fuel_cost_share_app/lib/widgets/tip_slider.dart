import 'package:flutter/material.dart';

// Slider for choosing a tip from 0% to 50% in steps of 10%
class TipSlider extends StatelessWidget {
  const TipSlider({
    super.key,
    required this.giftPercentage,
    required this.onSlided,
  });

  // Current tip as a fraction (0.0 - 0.5)
  final double giftPercentage;
  // Called with the new value whenever the slider moves
  final ValueChanged<double> onSlided;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: giftPercentage,
      onChanged: onSlided,
      min: 0,
      max: 0.5,
      divisions: 5,
      label: '${(giftPercentage * 100).round()}%',
    );
  }
}
