import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:livetimetable/screens/edit_timetable.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

var _firestore = Firestore.instance;
String sub;
bool showSpinner = true;
String username, password;

class TimeTable extends StatefulWidget {
  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  List<String> data = [];
  TextEditingController un, pwd;

  @override
  void initState() {
    for (var i = 0; i < 35; i++) data.add('$i');
    fetchData();

    super.initState();
  }

  void fetchData()  {
    setState(() => showSpinner = true);
    String key;
    DocumentReference dr;
    for (var i = 0; i < data.length; i++) {
      key = getKey(i);
      try {
        dr = _firestore.document("TimeTable/$key");
         dr.get().then((datasnapshot) {
          if (datasnapshot.exists) {
            setState(() {
              data[i] = datasnapshot.data['sub'];
            });
          }
        }).catchError((e) => print(e));
      } catch (e) {
        print(e);
      }
    }
    setState(() => showSpinner = false);
  }

  get orientation => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Time Table",
          style: TextStyle(
              fontSize: 25, color: Colors.black, fontFamily: 'M_semi_bold'),
        ),
        centerTitle: true,
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
        inAsyncCall: showSpinner,
        child: GridView.builder(
          itemCount: data.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (orientation == Orientation.portrait) ? 5 : 5),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 5,
              // color: index < 5 ? Colors.blue : Color(0xff69f0ae),

              color: index < 5
                  ? Colors.lightBlue[800]
                  : index < 10
                      ? Colors.lightBlue[700]
                      : index < 15
                          ? Colors.lightBlue[500]
                          : index < 20
                              ? Colors.lightBlue[300]
                              : index < 25
                                  ? Colors.lightBlue[100]
                                  : index < 30
                                      ? Colors.lightBlue[50]
                                      : Colors.white,

              child: GridTile(
                child: InkWell(
                  onTap: () => null,
                  splashColor: index < 5
                      ? Colors.white
                      : index < 10
                          ? Colors.lightBlue[50]
                          : index < 15
                              ? Colors.lightBlue[100]
                              : index < 20
                                  ? Colors.lightBlue[300]
                                  : index < 25
                                      ? Colors.lightBlue[500]
                                      : index < 30
                                          ? Colors.lightBlue[700]
                                          : Colors.lightBlue[800],
                  child: Center(
                      child: index < 5
                          ? days(index)
                          : Text(
                              data[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'M_semi_bold', fontSize: 15),
                            )),
                ), //just for testing, will fill with image later
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Alert(
              context: context,
              title: "LOGIN",
              content: Column(
                children: <Widget>[
                  TextField(
                    controller: un,
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_circle),
                      labelText: 'Username',
                    ),
                    onChanged: (value) => username = value,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: 'Password',
                    ),
                    onChanged: (value) => password = value,
                  ),
                ],
              ),
              buttons: [
                DialogButton(
                  color: Color(0xFF5FB808),
                  onPressed: () {
                    if (username == "admin" && password == "admin") {
                      Navigator.of(context).pop();
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => EditTimeTable(),
                      );
                    } else
                      Alert(
                        context: context,
                        title: "Login Failed",
                        type: AlertType.error,
                        buttons: [
                          DialogButton(
                            color: Color(0xFF5FB808),
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text(
                              "OKAY",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ],
                      ).show();
                  },
                  child: Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ]).show();
        },
        label: Text(
          "EDIT",
        ),
        icon: Icon(Icons.edit),
        backgroundColor: Color(0xFF5FB808),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget days(int index) {
    String day = "";
    switch (index) {
      case 0:
        day = "MON";
        break;
      case 1:
        day = "TUE";
        break;
      case 2:
        day = "WED";
        break;
      case 3:
        day = "THU";
        break;
      case 4:
        day = "FRI";
        break;
    }
    return Text(
      day,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
    );
  }

  String getKey(int index) {
    int a = index % 5;
    int row = a + 1;
    int temp = 0;
    while (index > 4) {
      temp += 1;
      index = index - 5;
    }
    int col = temp;
    String ans = "$row $col";
    return ans;
  }
}
