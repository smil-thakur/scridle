import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:scridle/myfirebase/get_players.dart';

class PaintScreen extends StatefulWidget {
  late String code;
  PaintScreen({Key? key, required this.code}) : super(key: key);

  @override
  State<PaintScreen> createState() => _PaintScreenState();
}

class _PaintScreenState extends State<PaintScreen> {
  List<Offset> points = [];
  @override

//scoket io  client connection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Text("room code is " + widget.code),
          Container(
            height: 250,
            width: 500,
            color: Colors.yellow[100],
            child: ClipRRect(
              child: GestureDetector(
                onPanDown: (details) {
                  setState(() {
                    points.add(details.localPosition);
                  });
                },
                onPanUpdate: (details) {
                  setState(() {
                    points.add(details.localPosition);
                  });
                },
                onPanEnd: (details) {
                  setState(() {
                    points.add(const Offset(-69, -69));
                  });
                },
                child: CustomPaint(
                  painter: MyCustomPainter(points: points),
                ),
              ),
            ),
          ),
          GetUsers(code: widget.code)
        ],
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  List<Offset> points;
  MyCustomPainter({required this.points});
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint background = Paint()..color = Colors.white;
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, background);

    Paint paint = Paint();
    paint.color = Colors.black;
    paint.strokeWidth = 2.0;
    paint.isAntiAlias = true;
    paint.strokeCap = StrokeCap.round;

    for (int x = 0; x < points.length - 1; x++) {
      if (points[x] != const Offset(-69, -69) &&
          points[x + 1] != const Offset(-69, -69)) {
        canvas.drawLine(points[x], points[x + 1], paint);
      } else if (points[x] != const Offset(-69, -69) &&
          points[x + 1] == const Offset(-69, -69)) {
        canvas.drawPoints(PointMode.points, [points[x]], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
