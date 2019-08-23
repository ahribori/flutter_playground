import 'package:flutter/material.dart';

class Painting extends StatefulWidget {
  @override
  _PaintingState createState() => _PaintingState();
}

class _PaintingState extends State<Painting> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        CustomPaint(
          painter: MyPainter(),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: Image(
                width: 150,
                image: NetworkImage(
                    'https://img1.daumcdn.net/thumb/R300x300/?fname=https%3A%2F%2Ft1.daumcdn.net%2Ffriends%2Fprod%2Fproduct%2FFRPBRYCAR8400_AW_00.jpg'),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: Text(
                "Daniel",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  Paint _paint;

  MyPainter() {
    Rect rect = new Rect.fromPoints(Offset(0, -1000), Offset(0, 200));

    final Gradient gradient = new LinearGradient(colors: <Color>[
      Colors.deepPurpleAccent,
      Colors.deepPurpleAccent.withAlpha(99),
    ], begin: Alignment(0, 0), end: Alignment(1, 1));

    _paint = Paint()
      ..shader = gradient.createShader(rect)
      ..color = Colors.deepPurpleAccent
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(0, -350), 500, _paint);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) {
    return false;
  }
}
