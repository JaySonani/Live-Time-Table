import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    animation =
        ColorTween(begin: Colors.black, end: Colors.white).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "Live",
                      style:
                          TextStyle(fontSize: 55.0, fontFamily: 'M_semi_bold'),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Time Table",
                      style: TextStyle(
                          fontSize: 55.0,
                          color: Color(0xFF5FB808),
                          fontFamily: 'M_semi_bold'),
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "OEP",
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Mobile Computing &\nWireless Communication",
                      style: TextStyle(fontSize: 20, fontFamily: 'M_regular'),
                    ),
                  ],
                ),
              ],
            ),
            Stack(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    RotateAnimatedTextKit(
                        duration: Duration(seconds: 5),
                        text: [
                          "Keny Shah",
                          "Malav Shah",
                          "Jaimi Sheta",
                          "Jay Sonani",
                          "Ewani Sukhadiya"
                        ],
                        textStyle:
                            TextStyle(fontSize: 20.0, fontFamily: "M_medium"),
                        textAlign: TextAlign.start,
                        alignment:
                            AlignmentDirectional.topEnd // or Alignment.topLeft
                        ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Group Members",
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () => Navigator.pushNamed(context, 'liveScreen'),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: Color(0xFF5FB808),
                    child: Text(
                      "GO LIVE",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'M_semi_bold',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  child: OutlineButton(
                    highlightedBorderColor: Color(0xFF5FB808),
                    highlightElevation: 3,
                    borderSide: BorderSide(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1.5),
                    onPressed: () => Navigator.pushNamed(context, 'timetable'),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: Colors.white,
                    child: Text(
                      "Time Table",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'M_semi_bold',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
