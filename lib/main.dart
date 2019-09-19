import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  Widget buildKey({Color keyColor, int soundId}) {
    return Expanded(
      child: FlatButton(
        color: keyColor,
        onPressed: () {
          final player = AudioCache();
          player.play('note$soundId.wav');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(7, (n) => n + 1)
                    .map((id) =>
                        buildKey(soundId: id, keyColor: Colors.primaries[id]))
                    .toList()),
          ),
        ),
      ),
    );
  }
}
