import 'package:flutter/material.dart';
import 'screen0.dart';
import 'screen1.dart';
import 'screen2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // MaterialApp has Routes attribute to define routes(screen navigation's), it accepts a HashMap which defines the screen routes
      // this methodology is better if our app has multiple screens and tough to maintain navigation routes.
      routes: {
        '/': (context) => Screen0(),
        '/first': (context) => Screen1(),
        '/second': (context) => Screen2()
      },
      // can also use 'initialRoute' attribute to mention the launch screen as a string which is defined in 'routes'
      //home: Screen0(),
      initialRoute: '/',
    );
  }
}
