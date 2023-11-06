import 'package:flutter/material.dart';
import 'package:mathspazzle/main.dart';
import 'package:mathspazzle/page2.dart';

import 'modelclass.dart';

class winner extends StatefulWidget {
  int index = 0;
  int k = 0;
  String s = "";
  winner(this.index, this.k);

  @override
  State<winner> createState() => _winnerState();
}

class _winnerState extends State<winner> {
int index = 0;
int k = 0;

  @override

  page1 l = page1();
  Widget build(BuildContext context) {
    l.get1(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('appimage/background.jpg'), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Text("PUZZLE ${widget.k - 1} COMPLETED",
                style: TextStyle(
                    height: l.FinalHeight * 0.006,
                    fontSize: l.FinalHeight * 0.039,
                    fontFamily: "mf3",
                    color: Colors.blueAccent)),
            Center(
              child: Container(
                margin: EdgeInsets.only(),
                child: Image.asset("appimage/trophy.png", height: l.FinalHeight * 0.32),
              ),
            ),
            InkWell(onTap: () {

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return page2();
              },));
            },
              child: Container(
                width: l.ScreenWidth * 0.43,
                margin: EdgeInsets.all(l.FinalHeight * 0.013),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                  child: Text("CONTINUE",
                      style: TextStyle(fontSize: 25, fontFamily: "mf1")),
                ),
              ),
            ),
            InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return page1();
              },));
            },
              child: Container(
                width: l.ScreenWidth * 0.43,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                  child: Text("MAIN MENU",
                      style: TextStyle(fontSize: l.FinalHeight * 0.032, fontFamily: "mf1")),
                ),
              ),
            ),
            Container(
              width: l.ScreenWidth * 0.43,
              margin: EdgeInsets.all(l.FinalHeight * 0.013),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: Text("BUY PRO",
                    style: TextStyle(fontSize: l.FinalHeight * 0.032, fontFamily: "mf1")),
              ),
            ),
            Container(
              margin: EdgeInsets.all(l.FinalHeight * 0.013),
              child: Center(
                child: Text("SHARE THIS PUZZLE",
                    style: TextStyle(
                        fontSize: l.FinalHeight * 0.032,
                        fontFamily: "mf1",
                        color: Colors.blueAccent)),
              ),
            ),
            Container(

              margin: EdgeInsets.all(l.FinalHeight * 0.013),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Icon(Icons.share,size: l.FinalHeight * 0.058,)
            ),
          ],
        ),
      ),
    );
  }
}
