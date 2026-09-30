import 'package:flutter/material.dart';
import 'package:fuel_cost_share_app/widgets/traveller_counter.dart';

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
  int numTravellers = 1;
  double _giftPercentage = 0.0;
  double fuel_cost = 0.0;

  ValueChanged<double>? get onChanged => null;

  //Methods
  void increment() {
    setState(() {
      numTravellers = numTravellers + 1;
    });
  }

  void decrement() {
    setState(() {
      if (numTravellers > 1) {
        numTravellers = numTravellers - 1;
      }
    });
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
          Container(
            padding: const EdgeInsets.all(18.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text('Total Fuel Cost Per Traveller', style: style),
                Text(
                  '£${((fuel_cost + fuel_cost * _giftPercentage) / numTravellers).toStringAsFixed(2)} ',
                  style: style.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontSize: theme.textTheme.displaySmall?.fontSize,
                  ),
                ),
              ],
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
                padding: const EdgeInsets.all(8.0),
                child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Fuel Cost',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (String value) {
                      setState(() {
                        fuel_cost = double.tryParse(value) ?? 0.0;
                      });
                    },
                  ),
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
                      Text('${fuel_cost * _giftPercentage}', style: theme.textTheme.titleMedium),
                    ],
                  ),
                  Text('${(_giftPercentage * 100).round()}%'),
                  Slider(
                    value: _giftPercentage,
                    onChanged: (value) {
                      setState(() {
                        _giftPercentage = value;
                      });
                    },
                    min: 0,
                    max: 0.5,
                    divisions: 5,
                    label: '${(_giftPercentage * 100).round()}%',
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
