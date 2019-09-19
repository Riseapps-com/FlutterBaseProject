import 'package:flutter/material.dart';
import 'package:flutter_base_app/colors/colors.dart';

class Error extends StatelessWidget {
  final String error;

  Error({this.error = ''});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          error,
          style: TextStyle(
            fontSize: 18,
            color: AppColors.primaryColor,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
