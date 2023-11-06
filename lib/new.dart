import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class one extends StatefulWidget {
  const one({Key? key}) : super(key: key);

  @override
  State<one> createState() => _oneState();
}

class _oneState extends State<one> {
  int a =0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forshare();
  }
  @override


  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              a++;
              ab!.setInt('key', a);
            });
          },child: Icon(Icons.add),
        ),
        body: Center(child: Text("$a",style: TextStyle(fontSize: 30),)),
      ),
    );
  }


  SharedPreferences? ab;
  Future<void> forshare() async {
    ab =await SharedPreferences.getInstance();
    setState(() {
      a = ab!.getInt('key')?? 0;
    });
  }

}
