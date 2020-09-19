import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('I Am Poor'),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Image(image: AssetImage('images/kailash.jpg')),
        ),
        backgroundColor: Colors.deepOrange,
      ),
    ),
  );
}
