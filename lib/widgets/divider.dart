import 'package:flutter/material.dart';

class Divider extends StatelessWidget {
  final double height;
  final Color color;

  Divider({this.height = 0.0, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: color,
    );
  }
}
