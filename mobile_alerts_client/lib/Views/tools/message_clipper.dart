
import 'package:flutter/material.dart';

class MessageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var firstOffset = Offset(size.width * 0.1, 0.0);
    var secondPoint = Offset(size.width * 0.15, size.height);
    var lastPoint = Offset(size.width * 0.2, 0.0);
    var path = Path()
      ..moveTo(firstOffset.dx, firstOffset.dy)
      ..lineTo(secondPoint.dx, secondPoint.dy)
      ..lineTo(lastPoint.dx, lastPoint.dy)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
