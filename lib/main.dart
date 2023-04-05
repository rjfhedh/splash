import 'dart:async';
import 'package:flutter/material.dart';
import "dice.dart";
import "betting.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 8),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SecondScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('images/crabs betting.jpg'),
            Image.asset('images/diceroll.gif'),
          ],
        ));
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Crappy Craps Crab Betting")),
      body:  Center(
          child: Container(
            decoration: BoxDecoration(color: Colors.red,),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(flex:3,child:DicePage()),
              Flexible(child:Betting()),
            ],
          ))),
    );
  }
}
