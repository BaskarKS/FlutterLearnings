import 'package:flutter/material.dart';

// Container can have only one child
// To contain more than one child have to use 'Column' and 'Row'
void main() {
  runApp(LaunchWidget());
}

// List of Widgets
// MaterialApp, Scaffold, Row, Column, CircleAvatar,
// SafeArea, Text, TextStyle, SizedBox, Divider, Card, ListTile
class LaunchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.red,
                backgroundImage: AssetImage('images/baskarks.jpg'),
              ),
              Text(
                'Baskar K S',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Senior Developer',
                style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'SourceSansPro',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.5,
                    color: Colors.teal[100]),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal[900],
                  ),
                  title: Text(
                    '+91-9880144492',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.teal[900],
                        fontFamily: 'SourceSansPro'),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'baskarks@gmail.com',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'SourceSansPro',
                      color: Colors.teal.shade900,
                    ),
                  ),
                  subtitle: Text('email-id'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Challenge
/*
class LaunchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.red,
                height: double.infinity,
                width: 100.0,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100.0,
                      width: 100.0,
                      color: Colors.yellow,
                    ),
                    Container(
                      height: 100.0,
                      width: 100.0,
                      color: Colors.green,
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.blue,
                height: double.infinity,
                width: 100.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

// Lesson to use Column Widget
/*
class LaunchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black12,
        body: SafeArea(
          child: Column(
            // max size of the column occupy the screen
            mainAxisSize: MainAxisSize.min,
            // Change direction of arrangement of widgets
            verticalDirection: VerticalDirection.up,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                color: Colors.orange,
                child: Text('Container 1'),
                height: 100.0,
                width: 100.0,
              ),
              SizedBox(
                height: 20,
                width: double.infinity,
              ),
              Container(
                color: Colors.white,
                child: Text('Container 2'),
                height: 100.0,
                width: 100.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 50.0,
              ),
              Container(
                color: Colors.green,
                child: Text('Container 3'),
                height: 100.0,
                width: 100.0,
              ),
              SizedBox(
                height: 45.0,
                width: 100.0,
              ),
              Container(
                width: double.infinity,
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

// To arrange only one child, used 'Container'
/*class LaunchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.redAccent,
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Text('Check'),
            margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
            padding: EdgeInsets.only(left: 30.0, top: 40.0),
            height: 100.0,
            width: 100.0,
          ),
        ),
      ),
    );
  }
}*/
