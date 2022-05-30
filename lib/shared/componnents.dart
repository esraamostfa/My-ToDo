import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void naveTo(context, widget) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => widget));
}


void navigateAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
        (rout) => false,
  );
}

void showToast(String message, ToastStates state) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastState(state),
      textColor: Colors.white,
      fontSize: 16.0
  );
}

enum ToastStates {success, error, warning}

Color chooseToastState(ToastStates state) {
  Color color;

  switch(state) {
    case ToastStates.success:
      color = Colors.green;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
    case ToastStates.warning:
      color = Colors.amber;
      break;
  }

  return color;
}