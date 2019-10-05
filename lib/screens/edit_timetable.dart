import 'package:flutter/material.dart';
// import 'package:livetimetable/screens/edit_database.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'edit_database.dart';

class EditTimeTable extends StatefulWidget {
  @override
  _EditTimeTableState createState() => _EditTimeTableState();
}

class _EditTimeTableState extends State<EditTimeTable> {
  String dropdownValue;
  int radioValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Select your lecture',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF5FB808),
                  fontSize: 30,
                  fontFamily: 'M_semi_bold'),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Select Day",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.keyboard_arrow_down),
                    iconSize: 30,
                    iconDisabledColor: Color(0xFF5FB808),
                    elevation: 16,
                    hint: Text(
                      "Choose",
                      style: TextStyle(fontFamily: 'M_medium'),
                    ),
                    style: TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Color(0xFF5FB808),
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>[
                      'Monday',
                      'Tuesday',
                      'Wednesday',
                      'Thursday',
                      'Friday'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'M_medium'),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 40,
            // ),
            Column(
              children: <Widget>[
                Text(
                  "Select lecture",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Radio(
                          groupValue: radioValue,
                          value: 1,
                          onChanged: (value) =>
                              setState(() => radioValue = value),
                          activeColor: Color(0xFF5FB808),
                        ),
                        Text(
                          '1',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Radio(
                          groupValue: radioValue,
                          value: 2,
                          onChanged: (value) =>
                              setState(() => radioValue = value),
                          activeColor: Color(0xFF5FB808),
                        ),
                        Text(
                          '2',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Radio(
                          groupValue: radioValue,
                          value: 3,
                          onChanged: (value) =>
                              setState(() => radioValue = value),
                          activeColor: Color(0xFF5FB808),
                        ),
                        Text(
                          '3',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Radio(
                          groupValue: radioValue,
                          value: 4,
                          onChanged: (value) =>
                              setState(() => radioValue = value),
                          activeColor: Color(0xFF5FB808),
                        ),
                        Text(
                          '4',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Radio(
                          groupValue: radioValue,
                          value: 5,
                          onChanged: (value) =>
                              setState(() => radioValue = value),
                          activeColor: Color(0xFF5FB808),
                        ),
                        Text(
                          '5',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Radio(
                          groupValue: radioValue,
                          value: 6,
                          onChanged: (value) =>
                              setState(() => radioValue = value),
                          activeColor: Color(0xFF5FB808),
                        ),
                        Text(
                          '6',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            Container(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  if (dropdownValue != null && radioValue != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditDB(
                              day: dropdownValue,
                              lecture: radioValue,
                            )),
                  );
                  }
                  else {
                    Alert(
                      context: context,
                      // type: AlertType.success,
                      title: "UH OH! 🙄",
                      desc: "Day and the lecture number are required.",
                      buttons: [
                        DialogButton(
                          color: Color(0xFF5FB808),
                          child: Text(
                            "OKAY",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'M_semi_bold'),
                          ),
                          onPressed: () => Navigator.pop(context),
                          width: 120,
                        )
                      ],
                    ).show();
                  }
                },
                padding: EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: Color(0xFF5FB808),
                child: Text(
                  "NEXT",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'M_semi_bold',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
