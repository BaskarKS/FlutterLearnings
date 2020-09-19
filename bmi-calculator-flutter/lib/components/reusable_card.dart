import 'package:flutter/material.dart';

//Extracted the reusable Container as a Flutter Widget to avoid repeating this container code everywhere
class ReusableCard extends StatelessWidget {
/*
  // Below is a constructor which is autogenerated which will be useful for the widgets that move on screen,
  // for stationary widgets its not used
  const ReusableCard({
    Key key,
  }) : super(
            key:
                key); // Key class is used to keep track of the state of the widgets
*/

  //PROPERTY
  // making all properties of a class as 'final' makes the object as 'immutable'.
  // because nobody is allowed to change the properties after the object is created
  final Color colour;
  final Widget cardChild;
  final Function onpress;
  //CONSTRUCTOR
  ReusableCard({@required this.colour, this.cardChild, this.onpress});

  //OVERRIDDEN METHODS
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}
