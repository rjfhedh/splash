import 'package:flutter/material.dart';
import "dart:math";


class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePage();
}

class _DicePage extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: TextButton(
            onPressed: () {
              setState(() {
                leftDiceNumber = Random().nextInt(5) + 1;
              });
            },
            child: Image.asset("images/dice$leftDiceNumber.png")),
      ),
      Expanded(
        child: TextButton(
            onPressed: () {
              setState(() {
                rightDiceNumber = Random().nextInt(5) + 1;
              });
            },
            child: Image.asset("images/dice$rightDiceNumber.png")),
      ),
    ]);
  }
}
