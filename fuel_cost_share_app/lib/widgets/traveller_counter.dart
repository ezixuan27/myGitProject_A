import 'package:flutter/material.dart';

// "Split" row with - / + buttons to change how many travellers share the cost
class TravellerCounter extends StatelessWidget {
  const new({
    super.key,
    required this.style,
    required this.numTravellers,
    required this.onDecrement,
    required this.onIncrement,
  });

  final TextStyle style;
  final int numTravellers;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Split',
          style: style.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
        Row(
          children: [
            IconButton(onPressed: onDecrement, icon: const Icon(Icons.remove)),
            Text('$numTravellers'),
            IconButton(onPressed: onIncrement, icon: const Icon(Icons.add)),
          ],
        ),
      ],
    );
  }
}
