import 'package:flutter/material.dart';

class Question1 extends StatefulWidget {
  @override
  _Question1State createState() => _Question1State();
}

class _Question1State extends State<Question1> {
  //create Map to check the onPressed value
  Map<String, String> answerCheck = {
    'images/black.png': 'black',
    'images/blue.png': 'blue',
    'images/green.png': 'green',
    'images/orange.png': 'orange',
    'images/purple.png': 'purple',
    'images/red.png': 'red',
    'images/white.png': 'white',
    'images/yellow.png': 'yellow',
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
                  if (answerCheck[image1] == 'purple') {
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
                  if (answerCheck[image2] == 'purple') {
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
          'မေးခွန်း ၁',
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
                  'ခရမ်းရောင်ကို ရွေးပါ',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: imageRow('images/black.png', 'images/blue.png'),
            ),
            Expanded(
              flex: 1,
              child: imageRow('images/green.png', 'images/orange.png'),
            ),
            Expanded(
              flex: 1,
              child: imageRow('images/purple.png', 'images/red.png'),
            ),
            Expanded(
              flex: 1,
              child: imageRow('images/white.png', 'images/yellow.png'),
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
