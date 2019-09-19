import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageError extends StatelessWidget {
  final double width;
  final double height;

  ImageError({this.width = 0.0, this.height = 0.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Center(
        child: Icon(Icons.error),
      ),
    );
  }
}
