import 'package:flutter/material.dart';
import 'package:mathspazzle/main.dart';

class page3 extends StatefulWidget {
  const page3({Key? key}) : super(key: key);

  @override
  State<page3> createState() => _page3State();
}

class _page3State extends State<page3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('appimage/background.jpg'), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            child: GridView.builder(itemCount: 75,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (BuildContext context, index) {
                // return Container(
                //   child: Icon(Icons.lock,size: 50,color: Colors.blueGrey,),
                //);
               if(page1.levelStatus[index] == "clear") {
                 return Container(
                   child: Image.asset("appimage/verified.png",)
                 );
               }  else if(page1.levelStatus[index] == "pending") {
                 return Container(
                   child: Image.asset("appimage/locked.png")
                 );
               }
              },
            ),
          ),
        ),
      ),
    );
  }
}
