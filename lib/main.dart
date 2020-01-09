import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[200],
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.blue[900],
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {

  int leftDiceNumber = 3;
  int rightDiceNumber = 1;
  int score = 0;

  void changeDiceFace(){
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;

      if(leftDiceNumber == rightDiceNumber){
        score +=1;
        getAlertBox();
      }
    });
  }
  void getAlertBox() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Row(
            children: <Widget>[
              new Text("hurrah "),
              Icon(
                Icons.favorite,
                color: Colors.pink,
                size: 24.0,
              ),
            ],
          ),
          content: Row(
            children: <Widget>[
              new Text("Your Score is $score"),
              Icon(
                Icons.insert_emoticon,
                color: Colors.yellow[700],
                size: 24.0,
              ),
            ],
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: RichText(
                    textAlign: TextAlign.center,
                    textScaleFactor: 3.0,
                    text: TextSpan(
                    text: 'Your Score is ',
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(text: '$score', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[900])),
                    ],
              ),
              ),
                  ),
                ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed: (){
                    changeDiceFace();
                  },
                  child: Image.asset('images/dice$leftDiceNumber.png'),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: (){
                    setState(() {
                      changeDiceFace();
                    });
                  },
                  child: Image.asset('images/dice$rightDiceNumber.png'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
