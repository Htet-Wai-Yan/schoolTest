import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:splashscreen/splashscreen.dart';
import 'package:schoolTest/question1.dart';
import 'package:schoolTest/question2.dart';
import 'package:schoolTest/question3.dart';

class SchoolTest extends StatefulWidget {
  @override
  _SchoolTestState createState() => _SchoolTestState();
}

class _SchoolTestState extends State<SchoolTest> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Pre School Test'),
        // ),
        body: Container(
          child: PageView(
            controller: _controller,
            children: [
              //SplashScreen(),
              Question1(),
              Question2(),
              Question3(),
            ],
          ),
        ),
      ),
    );
  }
}
