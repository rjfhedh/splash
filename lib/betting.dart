import "package:flutter/material.dart";

class Betting extends StatefulWidget {
  Betting({super.key});

  @override
  State<Betting> createState() => _BettingState();
}

class _BettingState extends State<Betting> {
  double bet = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 50),
        child: Row(
          children: [
            Flexible(
              child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 2)),
                  child:
                      Center(child: TextButton(child: Text("V", style: TextStyle(fontSize: 30)),
                      onPressed: () => {}
                      ,
                      ))),
            ),
            Flexible(
                flex: 2,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: Colors.cyan,
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Center(
                    child: Text("\$$bet", style: TextStyle(fontSize: 30)),
                  ),
                )),
             Flexible(
              child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 2)),
                  child:
                      Center(child: TextButton(child: Text("V", style: TextStyle(fontSize: 30)),
                      onPressed: () => {}
                      ,
                      ))),
            ),
          ],
        ));
  }
}
