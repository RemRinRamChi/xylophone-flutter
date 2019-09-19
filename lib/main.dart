import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
                children: List.generate(7, (n) => n + 1)
                    .map((id) => XyloPhoneKey(id))
                    .toList()),
          ),
        ),
      ),
    );
  }
}

class XyloPhoneKey extends StatelessWidget {
  final Color keyColor =
      Colors.primaries[Random().nextInt(Colors.primaries.length)];
  final int soundId;

  XyloPhoneKey(this.soundId);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: keyColor,
      child: FlatButton(
        onPressed: () {
          final player = AudioCache();
          player.play('note$soundId.wav');
        },
      ),
    );
  }
}
