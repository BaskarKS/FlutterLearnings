import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*  theme: ThemeData(           // defines a common theme for the entire app customizing colors for text, background color, common color for app bar etc
        primaryColor: Color(0xFF0A0E21),
        accentColor: Colors.purple,
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),*/
      theme: ThemeData.dark().copyWith(
        // Here it uses ThemeData.dark() instance and it takes a copy and further customize it.
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(), // this is the first screen
    );
  }
}
