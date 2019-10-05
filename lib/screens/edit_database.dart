import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

String key;

class EditDB extends StatefulWidget {
  final String day;
  final int lecture;
  EditDB({this.day, this.lecture});

  @override
  _EditDBState createState() => _EditDBState();
}

class _EditDBState extends State<EditDB> {
  bool _showSpinner = true;
  String sub, subject, fac, faculty;
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  @override
  void initState() {
    key = getKey(widget.day, widget.lecture);
    fetchData();

    super.initState();
  }

  void fetchData() async {
    try {
      await Firestore.instance
          .collection('TimeTable')
          .document(key)
          .get()
          .then((documentSnapshot) {
        setState(() {
          fac = documentSnapshot.data['fac'].toString();
          faculty = documentSnapshot.data['faculty'].toString();
          subject = documentSnapshot.data['subject'].toString();
          sub = documentSnapshot.data['sub'].toString();
          _showSpinner = false;
        });
      });
    } catch (e) {
      print(e);
    }

    _controller1.text = sub;
    _controller2.text = subject;
    _controller3.text = fac;
    _controller4.text = faculty;

    setState(() {
      _showSpinner = false;
    });
  }

  void updateData() async {
    setState(() {
      _showSpinner = true;
    });

    try {
      print(sub);
      await Firestore.instance.collection('TimeTable').document(key).updateData(
          {'sub': sub, 'subject': subject, 'fac': fac, 'faculty': faculty});
    } catch (e) {
      print(e);
    }

    setState(() {
      _showSpinner = false;
    });
    Alert(
        context: context,
        title: "Data updated",
        type: AlertType.success,
        buttons: [
          DialogButton(
            color: Color(0xFF5FB808),
            child: Text(
              "OKAY",
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontFamily: 'M_semi_bold'),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ]).show();
  }

  String getKey(String day, int lec) {
    String ret;
    switch (day) {
      case "Monday":
        ret = "1";
        break;
      case "Tuesday":
        ret = "2";
        break;
      case "Wednesday":
        ret = "3";
        break;
      case "Thursday":
        ret = "4";
        break;
      case "Friday":
        ret = "5";
        break;
    }
    ret = "$ret $lec";
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
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
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: height * 0.05,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Fill the details for",
                      style: TextStyle(fontSize: 20, fontFamily: 'M_regular'),
                    ),
                    Text("${widget.day}, Lecture ${widget.lecture}",
                        style: TextStyle(fontSize: 25)),
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Column(
                  children: <Widget>[
                    TextField(
                      onChanged: (value) => sub = value,
                      controller: _controller1,
                      decoration: InputDecoration(
                          labelText: "Subject", hintText: "For eg. DM"),
                    ),
                    TextField(
                      onChanged: (value) => subject = value,
                      controller: _controller2,
                      decoration: InputDecoration(
                          labelText: "Details",
                          hintText: "For eg. Data Mining"),
                    ),
                    TextField(
                      onChanged: (value) => fac = value,
                      controller: _controller3,
                      decoration: InputDecoration(
                          labelText: "Professor",
                          hintText: "For eg. Prof. Rakesh Patel"),
                    ),
                    TextField(
                      onChanged: (value) => faculty = value,
                      controller: _controller4,
                      decoration: InputDecoration(
                        labelText: "Note",
                        hintText: "For eg. Bring your calculators",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                RaisedButton(
                  onPressed: () {
                    updateData();
                  },
                  padding: EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: Color(0xFF5FB808),
                  child: Text(
                    "UPDATE",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'M_semi_bold',
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                OutlineButton(
                  highlightedBorderColor: Color(0xFF5FB808),
                  highlightElevation: 3,
                  borderSide: BorderSide(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 1.5),
                  onPressed: () {
                    _controller1.clear();
                    _controller2.clear();
                    _controller3.clear();
                    _controller4.clear();
                  },
                  padding: EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: Colors.white,
                  child: Text(
                    "CLEAR",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'M_semi_bold',
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
