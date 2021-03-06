import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title, required this.color}) : super(key: key);

  final String title;
  Color color;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _red = 0;
  int _green = 0;
  int _blue = 0;

  void _changeColor() {
    _red = Random.secure().nextInt(256);
    _green = Random.secure().nextInt(256);
    _blue = Random.secure().nextInt(256);
    setState(() {
      widget.color = Color.fromRGBO(_red, _green, _blue, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'The color is',
              style: TextStyle(
                  fontSize: 25
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.13,
              color: widget.color,
              child: const Center(
                child: Text(
                  'R(), G(), B()',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            )],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeColor,
        tooltip: 'Change color',
        child: const Icon(Icons.palette),
        backgroundColor: widget.color,
      ),
    );
  }
}
