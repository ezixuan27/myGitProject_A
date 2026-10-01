import 'package:flutter/material.dart';

class TipSlider extends StatelessWidget {
  const TipSlider({
    super.key,
    required this.giftPercentage,
    required this.onSlided,
  });

  final double giftPercentage;
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
