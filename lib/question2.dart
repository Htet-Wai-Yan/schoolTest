import 'package:flutter/material.dart';

class Question2 extends StatefulWidget {
  @override
  _Question2State createState() => _Question2State();
}

class _Question2State extends State<Question2> {
  //create Map to check the onPressed value
  Map<String, String> answerCheck = {
    'images/cucumber.png': 'cucumber',
    'images/brococoli.png': 'broccoli',
    'images/cabbage.png': 'cabbage',
    'images/carrot.png': 'carrot',
    'images/chili.png': 'chili',
    'images/corn.png': 'corn',
    'images/potato.png': 'potato',
    'images/tomato.png': 'tomato',
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
                  if (answerCheck[image1] == 'chili') {
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
                  if (answerCheck[image2] == 'chili') {
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
          'မေးခွန်း ၂',
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
                  'Vegetable မဟုတ်တာက ဘာလဲ',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: imageRow('images/cucumber.png', 'images/broccoli.png'),
            ),
            Expanded(
              flex: 1,
              child: imageRow('images/cabbage.png', 'images/carrot.png'),
            ),
            Expanded(
              flex: 1,
              child: imageRow('images/chili.png', 'images/corn.png'),
            ),
            Expanded(
              flex: 1,
              child: imageRow('images/potato.png', 'images/tomato.png'),
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
