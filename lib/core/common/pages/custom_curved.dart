import 'package:flutter/material.dart';

class CustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    final firstCurve =
        Offset(0, size.height - 50); // Increase Y value for more curve
    final lastCurve =
        Offset(50, size.height - 50); // Increase X value for more curve
    path.quadraticBezierTo(
        firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);

    final secondFirstCurve =
        Offset(0, size.height - 50); // Increase Y value for more curve
    final secondLastCurve = Offset(
        size.width - 50, size.height - 50); // Increase X value for more curve
    path.quadraticBezierTo(secondFirstCurve.dx, secondFirstCurve.dy,
        secondLastCurve.dx, secondLastCurve.dy);

    final thirdFirstCurve =
        Offset(size.width, size.height - 50); // Increase Y value for more curve
    final thirdLastCurve = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdFirstCurve.dx, thirdFirstCurve.dy,
        thirdLastCurve.dx, thirdLastCurve.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
