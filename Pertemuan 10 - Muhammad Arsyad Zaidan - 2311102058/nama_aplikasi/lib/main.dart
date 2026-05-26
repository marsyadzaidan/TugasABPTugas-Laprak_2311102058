import 'package:flutter/material.dart';

void main() => runApp(Flutter1());

class Flutter1 extends StatefulWidget {
  @override
  State<Flutter1> createState() => _Flutter1State();
}

class _Flutter1State extends State<Flutter1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Ini aplikasi saya")),
        body: Text("Ini data saya"),
      ),
    );
  }
}
