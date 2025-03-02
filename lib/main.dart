import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 2;

  void rollDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 221, 63, 52),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 235, 65, 52),
          title: Center(
            child: Text(
              'Dice Roller',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: Center(
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                    //after flutter 2.0 Textbutton is use instead of FlatButton
                    onPressed: () => (setState(() {
                          rollDice(); // Applied 1 because dice starts from 1 if it hits 0 then it will be 1
                        })),
                    child: Image.asset('images/dice$leftDiceNumber.png')),
              ),
              Expanded(
                //Epended ensures that widgets expand proportionally based on the space available.
                // flex: 1, In order to give it more Size
                child: TextButton(
                  onPressed: () =>
                      (setState //setState is used to update the state of the app
                          (() {
                    rollDice(); //Random().nextInt(6) + 1 is used to generate random number between 1 to 6
                  })),
                  child: Image.asset('images/dice$rightDiceNumber.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
