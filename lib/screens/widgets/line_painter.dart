
import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  final painter = Paint()..strokeWidth = 1; 
  @override
  void paint(Canvas canvas, Size size) {
      canvas.drawLine(const Offset(0, 0), Offset(size.width, size.height), painter);
      canvas.drawLine(Offset(size.width, 0), Offset(0, size.height), painter); 
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
  
  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;
}