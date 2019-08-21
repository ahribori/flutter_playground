import 'package:flutter/material.dart';

class Painting extends StatefulWidget {
  @override
  _PaintingState createState() => _PaintingState();
}

class _PaintingState extends State<Painting> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
          "안녕!!!!",
        ),
        transform: Matrix4.rotationZ(45 * 3.141592 / 180),

        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(5)));
  }
}
