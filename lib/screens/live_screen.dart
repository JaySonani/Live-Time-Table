import 'package:flutter/material.dart';
import 'package:livetimetable/get_time.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var _firestore = Firestore.instance;
String fac = "", faculty = "", sub = "", subject = "";
bool _showSpinner = true;

class LiveScreen extends StatefulWidget {
  @override
  _LiveScreenState createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  @override
  void initState() {
    fetchData();

    super.initState();
  }

  void fetchData() async {
    String key = MyTime().ret;
    try {
      await _firestore
          .collection('TimeTable')
          .document(key)
          .get()
          .then((documentSnapshot) {
        setState(() {
          _showSpinner = false;
          fac = documentSnapshot.data['fac'].toString();
          faculty = documentSnapshot.data['faculty'].toString();
          subject = documentSnapshot.data['subject'].toString();
          sub = documentSnapshot.data['sub'].toString();
        });
      });
    } catch (e) {
      print(e);
    }
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
          child: Stack(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "CURRENT",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontFamily: 'M_semi_bold'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Lecture",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontFamily: 'M_medium'),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: height * 0.25),
                decoration: BoxDecoration(
                  color: Color(0xfff0f0f0),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyCard(
                    color: Colors.red[900],
                    head: sub,
                    label: subject,
                    spClr: Colors.redAccent,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  MyCard(
                    color: Color(0xFF5FB808),
                    head: fac,
                    label: faculty,
                    spClr: Colors.greenAccent,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class MyCard extends StatelessWidget {
  final Color color, spClr;
  final String head, label;
  MyCard({this.color, this.head, this.label, this.spClr});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 10,
          color: color,
          child: InkWell(
            splashColor: spClr,
            onTap: () {},
            child: Container(
              width: 300,
              height: height * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    head,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'M_semi_bold',
                        fontSize: 30.0,
                        color: Colors.white),
                  ),
                  Text(
                    label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'M_regular',
                        fontSize: 25.0,
                        color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
