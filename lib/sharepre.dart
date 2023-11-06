import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sharepr extends StatefulWidget {
  const sharepr({Key? key}) : super(key: key);

  @override
  State<sharepr> createState() => _shareprState();
}

class _shareprState extends State<sharepr> {
  int a = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forShare();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              a++;
              sp!.setInt("key1", a);
            });
          },
          child: Icon(Icons.add)),
      body: SafeArea(
          child: Center(
              child: Text(
        "$a",
        style: TextStyle(fontSize: 40),
      ))),
    );
  }

  SharedPreferences? sp;

  Future<void> forShare() async {
    sp = await SharedPreferences.getInstance();
    setState(() {
      a = sp!.getInt("key1") ?? 0;
    });
  }
}
