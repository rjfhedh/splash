import 'dart:math';
import 'package:flutter/material.dart';


class DicePage extends StatefulWidget {
  @override
  DicePageState createState() => DicePageState();
}

class DicePageState extends State<DicePage> {
  int rightDiceNumber = 1;
  int leftDiceNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Image.asset('images/dice$leftDiceNumber.png'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Image.asset('images/dice$rightDiceNumber.png'),
                ),
              ),

            ],
          ),
                    Expanded(
              child: TextButton(
            onPressed: () {
              setState(() {
                rightDiceNumber = Random().nextInt(6) + 1;
                leftDiceNumber = Random().nextInt(6) + 1;
              });
            },
            child: Image.asset('images/Red_button.png'),
          )),
        ],
      ),
    );
  }
}
