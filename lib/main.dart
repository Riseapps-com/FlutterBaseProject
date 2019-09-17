import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/blocs/blocs.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Base Project',
      home: null,
    );
  }
}
