import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //String homeData = 'Changed';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NotifyData>(
      create: (_) => NotifyData(),
      lazy: false,
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.tealAccent,
          appBar: AppBar(
            title: MyText(),
            centerTitle: true,
          ),
          body: FirstLevel(),
        ),
      ),
    );
  }
}

class FirstLevel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SecondLevel();
  }
}

class SecondLevel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextEntry(),
        ThirdLevel(),
      ],
    );
  }
}

class ThirdLevel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      Provider.of<NotifyData>(context).data,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
    );
  }
}

class TextEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newText) {
        Provider.of<NotifyData>(context).updateData(newText);
      },
    );
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      Provider.of<NotifyData>(context).data,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
    );
  }
}

class NotifyData extends ChangeNotifier {
  String data = 'Default';
  void updateData(String change) {
    this.data = change;
    notifyListeners();
  }
}
