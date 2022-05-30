import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          onPressed: (){
            throw new FormatException();
          },
          child: Text('crash')),
    );
  }
}
