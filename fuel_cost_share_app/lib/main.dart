import 'package:flutter/material.dart';

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
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 243, 159, 94))),
      home: Fgift(),
    );
  }
}

class Fgift extends StatefulWidget{
  const new({super.key});

  @override
  State<Fgift> createState() => _FgiftState();
}

class _FgiftState extends State<Fgift> {
  int numTravellers = 1;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final style = theme.textTheme.titleMedium!.copyWith(
          color: theme.colorScheme.onPrimary,
          fontWeight: FontWeight.bold
    );
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Fuel Cost Sharing')
      ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration
            (color: Theme.of(context).colorScheme.inversePrimary,
            borderRadius: BorderRadius.circular(10),
            ),
            child:  
            Column(
              children: [
                Text(
                  'Total Fuel Cost Per Traveller',
                   style: style,
                ),
                Text('£00.00',
                style:style.copyWith(
                color: theme.colorScheme.onPrimary,
                fontSize: theme.textTheme.displaySmall?.fontSize
                ),
                ),
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
     
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: theme.colorScheme.primary,
                    width: 2
                  )
                ),
                child:  Column(
                  children:[
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Fuel Cost'),
                      keyboardType: TextInputType.number,
                      onChanged: (String value){
                        print("Value: $value");
                      }
                  ),
                  //Split Bill area
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Split',
                      style: style.copyWith(
                        color: Colors.black,
                        fontSize: theme.textTheme.titleMedium?.fontSize,
                        fontWeight: FontWeight.normal
                      ),
                      ),
                    Row(
                      children: [
                        IconButton(
                          color: Colors.black,
                          onPressed: () {
                            if (numTravellers > 1) {
                              setState(() {
                              numTravellers--;
                              });
                            }},
                          icon: const Icon(Icons.remove),
                          ), 
                        Text('$numTravellers',),
                        IconButton(
                          color: Colors.black,
                          onPressed: () {
                            setState(() {
                              numTravellers++;
                            });
                          },
                          icon: const Icon(Icons.add),
                        )
                      ],
                    )
                    ],
                    
                  )
                 
                 
                  ]               
                  )
              ),
            )
        ],
      )
    );
  }
}