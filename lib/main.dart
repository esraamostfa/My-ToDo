import 'package:flutter/material.dart';
import 'package:my_todo/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override  // This widget is the root of your application.
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My ToDo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

