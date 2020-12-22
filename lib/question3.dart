import 'package:flutter/material.dart';

class Question3 extends StatefulWidget {
  @override
  _Question3State createState() => _Question3State();
}

class _Question3State extends State<Question3> {
  //create Map to check the onPressed value
  Map<String, String> answerCheck = {
    'images/bus.png': 'bus',
    'images/cargo-track.png': 'cargo-track',
    'images/cargo-track1.png': 'cargo-track1',
    'images/cargo-track2.png': 'cargo-track2',
    'images/cargo-track3.png': 'cargo-track3',
    'images/cargo-track4.png': 'cargo-track4',
    'images/cargo-track5.png': 'cargo-track5',
    'images/tractor.png': 'tractor',
  };

  //Initially color is set to grey which will be changed to green or red when button is pressed
  Color correctColor = Colors.transparent;
  Color incorrectColor = Colors.transparent;
  //create custom widgets to store the result container value
  Widget incorrect(incorrectColor) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(10),
        color: incorrectColor,
        child: Icon(Icons.clear, color: Colors.white70),
      ),
    );
  }

  Widget correct(correctColor) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(10),
        color: correctColor,
        child: Icon(Icons.check, color: Colors.white70),
      ),
    );
  }

  //create custom widget to reuse in layout
  Widget imageRow(String image1, String image2) {
    //pass by image reference to dynamically add the image in the container
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      //image rows starts
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: FlatButton(
              onPressed: () {
                setState(() {
                  if (answerCheck[image1] == 'tractor') {
                    correctColor = Colors.green;
                    return correct(correctColor);
                  } else {
                    incorrectColor = Colors.red;
                    return incorrect(incorrectColor);
                  }
                }); //check condition
              },
              child: Image.asset(image1),
              color: Colors.brown,
            ),
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              onPressed: () {
                setState(() {
                  if (answerCheck[image2] == 'tractor') {
                    correctColor = Colors.green;
                    return correct(correctColor);
                  } else {
                    incorrectColor = Colors.red;
                    return incorrect(incorrectColor);
                  }
                }); //check condition
              },
              child: Image.asset(image2),
              color: Colors.brown,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[900],
        title: Text(
          'မေးခွန်း ၃',
          style: TextStyle(color: Colors.white70),
        ),
      ),
      body: Container(
        color: Colors.brown,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'ထွန်စက်ကို ရွေးပါ',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: imageRow('images/bus.png', 'images/cargo-track.png'),
            ),
            Expanded(
              flex: 1,
              child: imageRow(
                  'images/cargo-track1.png', 'images/cargo-track2.png'),
            ),
            Expanded(
              flex: 1,
              child: imageRow('images/tractor.png', 'images/cargo-track4.png'),
            ),
            Expanded(
              flex: 1,
              child: imageRow(
                  'images/cargo-track5.png', 'images/cargo-track3.png'),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                  children: [
                    Expanded(flex: 1, child: incorrect(incorrectColor)),
                    Expanded(flex: 1, child: correct(correctColor)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
