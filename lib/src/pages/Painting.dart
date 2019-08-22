import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  Paint _paint;

  MyPainter() {
    Rect rect = new Rect.fromPoints(Offset(0, -2500), Offset(0, 200));

    final Gradient gradient = new LinearGradient(colors: <Color>[
      Colors.deepPurpleAccent.withAlpha(99),
      Colors.deepPurpleAccent,
    ], begin: Alignment(0, 0), end: Alignment(1, 1));

    _paint = Paint()
      ..shader = gradient.createShader(rect)
      ..color = Colors.deepPurpleAccent
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(0, -400), 500, _paint);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) {
    return false;
  }
}

class Painting extends StatefulWidget {
  @override
  _PaintingState createState() => _PaintingState();
}

class _PaintingState extends State<Painting> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CustomPaint(
          painter: MyPainter(),
        ),
      ],
    );
  }
}
