import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

// Newly Used Widgets here:
// StatefulWidget, FlatButton, Expanded(To share the amount of space in screen)

// short cut to create StatefulWidget in Intellij using 'stful'
// short cut to create in StatelessWidget Intellij using 'stless'

class DicePage extends StatefulWidget {
  @override
  _State createState() => _State();
}

/*
 Inbuild Private class defined which comes along with StatefulWidget to
 maintain the state of widget
 */
class _State extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  void rollDice() {
    leftDiceNumber = Random().nextInt(6) + 1;
    rightDiceNumber = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: FlatButton(
              onPressed: () {
                /*
                State change variable has to be written inside setState() to affect the state
                 and reload the widget by calling build() internally.
                 */
                setState(() {
                  //using math library to generate a random number between 1-6
                  rollDice();
                });
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ), // using different constructor
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  rollDice();
                });
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}

// Stateless widget are not meant to change, if the class which extends a StatelessWidget is forced
// to use variables and its values expect to change its best to use StatefullWidget.

// In the below case the functionality is to change the dice image "onPress()" of the button, hence its
// best to define the DicePage class to use StatefullWidget instead of StatelessWidget.

// "If we are creating a user interface where the state of the widget isn't going to change then its best
// to define its as a StatelessWidget.
// "If we are creating a user interface where the state of the widget is going to change based on some
// user interaction then its best to define its as a StateFullWidget.
/*class DicePage extends StatelessWidget {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: FlatButton(
              onPressed: () {},
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ), // using different constructor
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {},
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
*/

// Learned about Expanded Widget and New way of creating Image widget
/*
// 'Expanded Class' has to be used as child of Row / Column, it expands the child of Row/Column
//to fill the available space in main axis, if multiple children are there in row / column then available
// space is divided among them.
// Only one child can be mentioned in Expanded widget in "child:"
// In "flex" we can mention the number of times of space the child can occupy.
// Row(children:[Expanded(child:(Image(image: Image1), flex: 2), Expanded(child:(Image(image: Image2), flex: 1))
// Image1 will occupy the screen row with twice the amount of space than the Image2

// we can create a image widget instead of like "Image(image: AssetImage('image path and name'))
// by using direct asset constructor like Image.asset('image path and name')
class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          //flex: 2,
          child: Image.asset('images/dice1.png'), // using different constructor
        ),
        Expanded(
          //flex: 1,
          child: Image.asset('images/dice5.png'),
        ),
      ],
    );
  }
}
*/

// Initial App
/*class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}*/
