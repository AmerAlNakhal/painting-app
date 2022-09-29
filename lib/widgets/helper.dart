import 'package:flutter/material.dart';

class HelperS {
  static void showMessage(BuildContext context, String message,
      {bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 5,
        backgroundColor: error ? Colors.red : Colors.green,
        margin: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 5),
      ),
    );
  }
}
