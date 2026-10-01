import 'package:flutter/material.dart';

class EnterFuelCost extends StatelessWidget {
  const new({super.key, required this.onEntered});

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
