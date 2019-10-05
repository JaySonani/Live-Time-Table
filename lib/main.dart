import 'package:flutter/material.dart';
import 'package:livetimetable/screens/edit_database.dart';
import 'package:livetimetable/screens/live_screen.dart';
import 'package:livetimetable/screens/welcome_screen.dart';
import 'package:livetimetable/screens/time_table.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'M_medium', primaryColor: Color(0xFF5FB808)),
      title: 'Live Time Table',
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
      routes:  {
        'liveScreen' : (context) => LiveScreen(),
        'timetable' : (context) =>  TimeTable(),
        'editdb' : (context) => EditDB(),
      },



    );
  }
}