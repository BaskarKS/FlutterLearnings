import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
/*
  const BottomButton({
    Key key,
  }) : super(key: key);
*/
  final Function onTap;
  final String buttonTitle;
  BottomButton({this.buttonTitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColour,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
        padding: EdgeInsets.only(
          bottom: 20.0,
        ),
      ),
    );
  }
}
