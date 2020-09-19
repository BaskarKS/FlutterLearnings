import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Screen 2'),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.blue,
          child: Text('Go Back To Screen 1'),
          onPressed: () {
            // Normal Navigation without using "Names" to Routes.
            Navigator.pop(
                context); // from screen1 -> launch Screen2 -> press back / home -> go back to screen1
          },
        ),
      ),
    );
  }
}
