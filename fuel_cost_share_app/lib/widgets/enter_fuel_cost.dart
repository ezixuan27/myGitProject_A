import 'package:flutter/material.dart';

// Number only text field where the user types the total fuel cost
class EnterFuelCost extends StatelessWidget {
  const new({super.key, required this.onEntered});

  // Called with the raw text every time the input changes
  final ValueChanged<String> onEntered;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter Fuel Cost',
      ),
      keyboardType: TextInputType.number,
      onChanged: onEntered,
    );
  }
}
