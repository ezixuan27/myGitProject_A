import 'package:flutter/material.dart';


class TotalFuelPerTravellerTitle extends StatelessWidget {
  const new({
    super.key,
    required this.style,
  });

  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text('Total Fuel Cost Per Traveller', style: style);
  }
}