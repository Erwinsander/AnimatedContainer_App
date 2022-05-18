import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(AniCont());

class AniCont extends StatefulWidget {
  const AniCont({Key? key}) : super(key: key);

  @override
  State<AniCont> createState() => _AniContState();
}

class _AniContState extends State<AniCont> {
  double _width = 100.0;
  double _height = 100.0;
  Color _color = Colors.blue;
  double _rad = 10.0;

  double _randomNumber3 = 50;

  double _randomNumber2 = 50;

  Random random = new Random();

  void _cambiarContainer() {
    _width = _randomNumber3 + 10;
    _height = _randomNumber3 + _randomNumber2;
    _color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    _rad = _randomNumber3 * 0.1;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Animated Container",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Animated Container"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: _width,
                  height: _height,
                  decoration: BoxDecoration(
                      color: _color, borderRadius: BorderRadius.circular(_rad)),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _randomNumber3 = random.nextDouble() * 300;
                _randomNumber2 = random.nextDouble() * 100;
                _cambiarContainer();
              },
              child: Text("Cambiar Container"),
            )
          ],
        ),
      ),
    );
  }
}
