import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDice = 1;
  int rightDice = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: AppBar(
            backgroundColor: Colors.redAccent, title: const Text('Dice game')),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(32),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Image.asset('assets/d$leftDice.png')),
                  const SizedBox(width: 20),
                  Expanded(child: Image.asset('assets/d$rightDice.png'))
                  // Image(image: AssetImage('assets/d1.png'), width: 300)
                ],
              ),
            ),
            SizedBox(height: 60),
            ButtonTheme(
              minWidth: 100,
              height: 60,
              child: RaisedButton(
                  child: const Icon(Icons.play_arrow,
                      color: Colors.white, size: 50),
                  color: Colors.orangeAccent,
                  onPressed: () {
                    setState(() {
                      leftDice = Random().nextInt(6) + 1;
                      rightDice = Random().nextInt(6) + 1;
                    });
                    showToast("Left Dice: {$leftDice}, Right Dice: {$rightDice}");
                  }),
            )
          ],
        )));
  }
}

void showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      textColor: Colors.black,
      backgroundColor: Colors.white,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM);
}
