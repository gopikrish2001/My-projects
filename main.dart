import 'package:flutter/material.dart';
import 'package:project/bloc_app/features/home/ui/home.dart';
import 'package:project/calculator.dart';
import 'package:project/counter.dart';

void main() {
  runApp(const MyApp());
}

void runApp(MyApp myApp) {
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Counter(),
    );
  }
}
