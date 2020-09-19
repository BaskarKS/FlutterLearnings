import 'package:flutter/material.dart';
// to help us play sound mentioned in 'assets' folder in both ios/android we need some third party
// packages / libraries.

//flutter packages are open source libraries of code which other people have created and shared it.

// we are going to use 'english_words' package in "pub.dev/packages/english_words"

/*
cupertino_icons package is defined by flutter team, which defined icons to be used by IOS
'cupertino_icons' this is the name used in site to define this package, same name should be used here
this will help the yaml file to search the site and download the mentioned package.
if no number is mentioned after the package name ('cupertino_icon'), yaml is allowed to download any version

if a version number is mentioned after the name using '^' then its limited to download the mentioned
version or any version later that and less than the major version. Eg: If we mention ^0.1.2
Use any version later than 0.1.2 (0.1.3 or 1.1.5 or 0.2.0 or 0.9.9 but not 1.x.x) first number should not
exceed 0

packages are downloaded into our current project into project -> external libraries -> dart packages
*/

// below package will have data on mostly used english words in nouns / adjectives /..
import 'package:english_words/english_words.dart';
//using a external package to play sounds
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioCache();

  AudioCache get getPlayer {
    return player;
  }

  void playFile(int soundNo) => getPlayer.play("note$soundNo.wav");

// My defined function
/*  Widget buildKey(MaterialColor userColor, int soundNo) {
    return Expanded(
        child: FlatButton(
      onPressed: () {
        playFile(soundNo);
      },
      color: userColor,
    ));
  }*/
  Expanded buildKey({Color color, int soundNo}) {
    return Expanded(
        child: FlatButton(
      onPressed: () {
        playFile(soundNo);
      },
      color: color,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(color: Colors.red, soundNo: 1),
              buildKey(color: Colors.deepOrange, soundNo: 2),
              buildKey(color: Colors.yellow, soundNo: 3),
              buildKey(color: Colors.green, soundNo: 4),
              buildKey(color: Colors.teal, soundNo: 5),
              buildKey(color: Colors.blue, soundNo: 6),
              buildKey(color: Colors.purple, soundNo: 7),
            ],
          ),
        ),
      ),
    );
  }
}

// Challenge Worked to Play sounds
/*
class XylophoneApp extends StatelessWidget {
  final player = AudioCache();

  AudioCache get getPlayer {
    return player;
  }

  void playFile(String fileName) {
    getPlayer.play(fileName);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                onPressed: () {
                  playFile('note1.wav');
                },
                color: Colors.red,
              ),
              FlatButton(
                onPressed: () {
                  playFile('note2.wav');
                },
                color: Colors.deepOrange,
              ),
              FlatButton(
                onPressed: () {
                  playFile('note3.wav');
                },
                color: Colors.yellow,
              ),
              FlatButton(
                onPressed: () {
                  playFile('note4.wav');
                },
                color: Colors.green,
              ),
              FlatButton(
                onPressed: () {
                  playFile('note5.wav');
                },
                color: Colors.green.shade900,
              ),
              FlatButton(
                onPressed: () {
                  playFile('note6.wav');
                },
                color: Colors.blue,
              ),
              FlatButton(
                onPressed: () {
                  playFile('note7.wav');
                },
                color: Colors.purple,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

// Sample code to show the usage of 'english_words' package.
/*
class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Text(nouns.first),
          ),
        ),
      ),
    );
  }
}
*/
