import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mathspazzle/main.dart';
import 'package:mathspazzle/modelclass.dart';
import 'package:mathspazzle/winnerpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class page2 extends StatefulWidget {
  int k;
  int index = 0;

  //page2(this.page1.k, this.index);
  page2([this.index = 0, this.k = 0]);

  //List slist = [];
  // String Lock = "lock";
  // String Clear = "clear";
  // String Time = "time";
  // String Skip = "skip";

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  List list = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
  String s = "";

  // int index = 0;
  page1 l = page1();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("******************");
  }

  @override
  Widget build(BuildContext context) {
    l.get1(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('appimage/gameplaybackground.jpg'),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 35, left: 10),
                child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                                "Skip\n\nAre You Sure.....\nYou Want To Skip This Level?"),
                            actions: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text("CANCEL",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.redAccent,
                                        fontFamily: "mf3")),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Text("OK",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.redAccent,
                                        fontFamily: "mf3")),
                              )
                            ],
                          );
                        },
                      );
                    },
                    child: Image.asset("appimage/right-arrow.png", height: 45)),
              ),
              Container(
                  margin: EdgeInsets.only(top: 50, left: 40),
                  child: Center(
                    child: Container(
                      height: 70,
                      width: 200,
                      child: Center(
                          child: Text(
                        "Puzzle ${page1.k}",
                        style: TextStyle(fontSize: 32, fontFamily: "mf2"),
                      )),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("appimage/level_board.png"),
                              fit: BoxFit.fill)),
                    ),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 35, left: 40),
                  child: InkWell(
                    onTap:() {
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(
                          title: Text(
                              "Hint"),
                          actions: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text("OK",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.redAccent,
                                      fontFamily: "mf3")),
                            ),
                          ],
                        );
                      },);
                    },
                    child: Image.asset(
                      "appimage/idea.png",
                      height: 50,
                    ),
                  )),
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(bottom: 100),
            child: Image.asset(
              Modelclass().photolist[page1.index],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 90),
            height: 100,
            color: Colors.black,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${s}",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      margin: EdgeInsets.only(top: 8, left: 3),
                      height: 40,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          s = s.substring(0, s.length - 1);
                        });
                      },
                      child: Container(
                          margin: EdgeInsets.only(top: 10, left: 10),
                          height: 40,
                          child: Image.asset("appimage/arrow-left.png")),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (s == "${Modelclass().anslist[page1.index]}") {
                            page1.levelStatus[page1.index] = "clear";
                            page1.sp!.setString('key$page1.index', "clear");
                            Modelclass().photolist[page1.index++];
                            page1.k++;
                            s = "";
                            page1.sp!.setInt('key', page1.k);
                            page1.sp!.setInt("puzzle", page1.index);
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return winner(page1.index, page1.k);
                              },
                            ));
                          } else {
                            Fluttertoast.showToast(
                                msg: "Wrong Answer",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.white,
                                textColor: Colors.black,
                                fontSize: 26.0);
                          }
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(15),
                        child: Text(
                          "SUBMIT",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontFamily: "mf1"),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                    children: List.generate(10, (index) {
                  return get1(index, 0);
                }))
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget get1(int index, int i) {
    l.get1(context);
    return Container(
      margin: EdgeInsets.all(l.FinalHeight * 0.006),
      height: l.FinalHeight * 0.049,
      width: l.ScreenWidth * 0.073,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.grey,
        border: Border.all(color: Colors.white),
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            s = s + list[index];
          });
        },
        child: Center(
            child: Text(
          "${list[index]}",
          style: TextStyle(fontSize: l.FinalHeight * 0.026, fontFamily: "mf2"),
        )),
      ),
    );
  }
}
