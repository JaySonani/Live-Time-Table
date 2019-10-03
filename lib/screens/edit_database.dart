import 'package:flutter/material.dart';

class EditDB extends StatelessWidget {

  final String day;
  final int lecture;

  EditDB({this.day, this.lecture});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF5FB808),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Center(
          child: Text("$lecture $day"),
        ),
    );
  }
}