import 'package:flutter/material.dart';
/*
在 iOS 上，你通过 CoreGraphics 来在屏幕上绘制线条和形状。Flutter 有一套基于 Canvas 类的不同的 API，还有 CustomPaint 和 CustomPainter 这两个类来帮助你绘图。后者实现你在 canvas 上的绘图算法。

想要学习如何实现一个笔迹画笔，请参考 Collin 在 StackOverflow 上的回答。*/
class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);

  final List<Offset> points;

  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null)
        canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  bool shouldRepaint(SignaturePainter other) => other.points != points;
}

class Signature extends StatefulWidget {
  SignatureState createState() => SignatureState();
}

class SignatureState extends State<Signature> {
  List<Offset> _points = <Offset>[];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      body: GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          setState(() {
            RenderBox referenceBox = context.findRenderObject();
            Offset localPosition =
                referenceBox.globalToLocal(details.globalPosition);
            _points = List.from(_points)..add(localPosition);
          });
        },
        onPanEnd: (DragEndDetails details) => _points.add(null),
        child: CustomPaint(
            painter: SignaturePainter(_points), size: Size.infinite),
      ),
    );
  }
}
