import 'package:flutter/material.dart';

class CurvePainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip

    Path path = Path();

    path.moveTo(0, 0);
    // path.lineTo(0, size.height*0.8);

    var controlePoint1 = Offset(size.width / 4, size.height);
    var controlPoint2 = Offset(3 * size.width / 4, size.height / 2);
    var endPoint = Offset(size.width, size.height);

    path.cubicTo(controlePoint1.dx, controlePoint1.dy, controlPoint2.dx,
        controlPoint2.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
