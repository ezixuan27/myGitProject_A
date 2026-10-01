import 'package:flutter/material.dart';
import 'package:fuel_cost_share_app/widgets/traveller_counter.dart';
import 'package:fuel_cost_share_app/widgets/tip_slider.dart';
import 'package:fuel_cost_share_app/widgets/enter_fuel_cost.dart';
import 'package:fuel_cost_share_app/widgets/total_fuel_per_traveller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fgift',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 243, 159, 94),
        ),
      ),
      home: Fgift(),
    );
  }
}

class Fgift extends StatefulWidget {
  const new({super.key});

  @override
  State<Fgift> createState() => _FgiftState();
}

class _FgiftState extends State<Fgift> {
  int numTravellers = 1; // never goes below 1
  double _giftPercentage = 0.0;
  double fuelCost = 0.0; // total fuel cost entered by the user

  //Methods
  // Add one traveller
  void increment() {
    setState(() {
      numTravellers = numTravellers + 1;
    });
  }

  // Remove one traveller, but keep at least 1
  void decrement() {
    setState(() {
      if (numTravellers > 1) {
        numTravellers = numTravellers - 1;
      }
    });
  }

  // Called by the tip slider
  void onChanged(double value) {
    setState(() {
      _giftPercentage = value;
    });
  }

  // Called by the fuel cost text field and invalid input counts as 0
  void onChangedFuelCost(String value) {
    setState(() {
      fuelCost = double.tryParse(value) ?? 0.0;
    });
  }

  // Split fuel costs evenly between travellers
  double calculateTotalFuelCost() {
    return (fuelCost + fuelCost * _giftPercentage) / numTravellers;
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final style = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Fuel Cost Sharing')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Top orange section of the page
          Container(
            padding: const EdgeInsets.all(18.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TotalFuelPerTraveller(
              style: style,
              theme: theme,
              toCalculate: calculateTotalFuelCost,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: theme.colorScheme.primary, width: 2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    // Fuel cost input
                    EnterFuelCost(onEntered: onChangedFuelCost),
                    //Split Bill area
                    TravellerCounter(
                      style: style,
                      numTravellers: numTravellers,
                      onIncrement: increment,
                      onDecrement: decrement,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tip', style: theme.textTheme.titleMedium),
                        Text(
                          (fuelCost * _giftPercentage).toStringAsFixed(2),
                          style: theme.textTheme.titleMedium,
                        ),
                      ],
                    ),
                    // Tip percentage display
                    Text('${(_giftPercentage * 100).round()}%'),
                    // Tip Slider
                    TipSlider(
                      giftPercentage: _giftPercentage,
                      onSlided: onChanged,
                    ),
                  ], //children wrapper
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
