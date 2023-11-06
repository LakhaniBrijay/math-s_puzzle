import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mathspazzle/lockpage.dart';
import 'package:mathspazzle/modelclass.dart';
import 'package:mathspazzle/page2.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

void main() {
  runApp(MaterialApp(
    home: page1(),
    debugShowCheckedModeBanner: false,
  ));
}

class page1 extends StatefulWidget {
  static List levelStatus = [];
  static SharedPreferences? sp;
  double ScreenHeight = 0;
  double ScreenWidth = 0;
  double NavBarHeight = 0;
  double StatusBarHeight = 0;
  double FinalHeight = 0;
  static int index=0;
  static int k=0;


  void get1(BuildContext context) {
    ScreenHeight = MediaQuery.of(context).size.height;
    ScreenWidth = MediaQuery.of(context).size.width;
    NavBarHeight = MediaQuery.of(context).padding.bottom;
    StatusBarHeight = MediaQuery.of(context).padding.top;
    FinalHeight = ScreenHeight - NavBarHeight - StatusBarHeight;
  }

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  int k = 0;
  int index=0;

  page1 l = page1();
  WidgetsToImageController pq = WidgetsToImageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forpermission();
    _createFolder();
    forShare();
  }

  Widget build(BuildContext context) {
    l.get1(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              "appimage/background.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Math Puzzle",
                style: TextStyle(MMa
                    fontFamily: "mf1",
                    color: Colors.blueAccent,
                    fontSize: l.FinalHeight * 0.049),
              ),
              Container(
                height: l.FinalHeight * 0.625,
                margin: EdgeInsets.only(
                    left: l.FinalHeight * 0.015,
                    right: l.FinalHeight * 0.015,
                    top: l.FinalHeight * 0.076),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("appimage/blackboard_main_menu.png"),
                        fit: BoxFit.fill)),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return page2(k);
                          },
                        ));
                      },
                      child: Text(
                        "CONTINUE\n",
                        style: TextStyle(
                            fontFamily: "mf",
                            color: Colors.white,
                            fontSize: l.FinalHeight * 0.057),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return page3();
                          },
                        ));
                      },
                      child: Text(
                        "PUZZLE\n",
                        style: TextStyle(
                            fontFamily: "mf",
                            color: Colors.white,
                            fontSize: l.FinalHeight * 0.057),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "BUY PRO",
                        style: TextStyle(
                            fontFamily: "mf",
                            color: Colors.white,
                            fontSize: l.FinalHeight * 0.057),
                      ),
                    ),
                  ],
                )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    padding: EdgeInsets.only(
                        top: l.FinalHeight * 0.038,
                        right: l.FinalHeight * 0.051),
                    onPressed: () {
                      pq.capture().then((imageBytes) async {
                        DateTime mm = DateTime.now();
                        String imagename =
                            "IMAGE${mm.day}${mm.month}${mm.year}${mm.hour}${mm.minute}.jpg";
                        String imagepth = "$folderpath/$imagename";
                        File file = File(imagepth);
                        List<int> bytes = imageBytes as List<int>;
                        file.writeAsBytes(bytes);
                        await file.create();
                        Share.shareFiles(['${file.path}']);
                      });
                    },
                    icon: Icon(Icons.share, size: l.FinalHeight * 0.051),
                  ),
                  IconButton(
                    padding: EdgeInsets.only(
                        top: l.FinalHeight * 0.038,
                        right: l.FinalHeight * 0.063),
                    onPressed: () {},
                    icon: Icon(Icons.mail, size: l.FinalHeight * 0.051),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
      // body: Container(
      //   height: double.infinity,
      //   width: double.infinity,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Container(
      //         child: Image.asset("appimage/blackboard_main_menu.png"),
      //       ),
      //       InkWell(
      //         onTap: () {
      //           Navigator.push(context, MaterialPageRoute(
      //             builder: (context) {
      //               return page2();
      //             },
      //           ));
      //         },
      //         child: Container(
      //           height: 100,
      //           width: 100,
      //           color: Colors.red,
      //         ),
      //       )
      //     ],
      //   ),
      //   decoration: BoxDecoration(
      //       image: DecorationImage(
      //           image: AssetImage("appimage/background.jpg"),
      //           fit: BoxFit.fill)),
      // ),
    );
  }

  Future<void> forpermission() async {
    PermissionStatus status = await Permission.camera.status;
    if (status.isDenied) {
      await Permission.storage.request();
    }
  }

  String folderpath = "";

  Future<void> _createFolder() async {
    var folderName = "Fl";
    var path = Directory("storage/emulated/0/Download/$folderName");
    if (await path.exists()) {
      print("exist");
    } else {
      print("not exist");
      await path.create();
    }

    setState(() {
      folderpath = path.path;
    });
  }


  Future<void> forShare() async {
    page1.sp = await SharedPreferences.getInstance();
    setState(() {
      page1.k = page1.sp!.getInt('key') ?? 1;
      page1.index = page1.sp!.getInt("puzzle") ?? 0;
      //page1.levelStatus.clear();
    for (int i = 0; i < Modelclass().anslist.length; i++) {
      String s = page1.sp!.getString('key$i') ?? "pending";
      page1.levelStatus.add(s);
    }
    print(page1.levelStatus);
    });
  }
}
