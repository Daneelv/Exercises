import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(String sound) async {
    final player = AudioPlayer();
    await player.play(
      AssetSource('note$sound.wav'),
    );
  }

  Widget BuildKey(Color col, String note) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: col, // Text Color
        ),
        onPressed: () async {
          playSound(note);
        },
        child: Container(
            // child: Text('Click Me'),
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              BuildKey(Colors.lightBlue, '1'),
              BuildKey(Colors.purpleAccent, '2'),
              BuildKey(Colors.yellow, '3'),
              BuildKey(Colors.green, '4'),
              BuildKey(Colors.orange, '5'),
              BuildKey(Colors.red, '6'),
              BuildKey(Colors.blueGrey, '7'),
            ],
          ),
        ),
      ),
    );
  }
}
