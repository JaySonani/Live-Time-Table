class MyTime {
  static DateTime now = DateTime.now();
  int hour = now.hour;
  int min = now.minute;
  int day = now.weekday;

  String ret = "";


  MyTime() {
    ret = "";
    switch (day) {
      case 1:
        if (hour <= 10 && min <= 45) {
          ret = "-1";
        } else if ((hour == 17 && min >= 45) || (hour > 17)) {
          ret = "0";
        } else if ((hour == 10 && min >= 45) || (hour == 11 && min < 45)) {
          ret = "1 1";
        } else if ((hour == 11 && min >= 45) || (hour == 12 && min < 45)) {
          ret = "1 2";
        } else if ((hour == 12 && min >= 45) || (hour == 13 && min < 30)) {
          ret = "Break";
        } else if ((hour == 13 && min >= 30) || (hour == 14 && min < 30)) {
          ret = "1 3";
        } else if ((hour == 14 && min >= 30) || (hour == 15 && min < 30)) {
          ret = "1 4";
        } else if ((hour == 15 && min >= 30) && (hour == 15 && min < 45)) {
          ret = "Break";
        } else if ((hour == 15 && min >= 45) || (hour == 16 && min < 45)) {
          ret = "1 5";
        } else if ((hour == 16 && min >= 45) || (hour == 17 && min < 45)) {
          ret = "1 6";
        }
        break;

      case 2:
        if (hour <= 10 && min <= 45) {
          ret = "-1";
        } else if ((hour == 17 && min >= 45) || (hour > 17)) {
          ret = "0";
        } else if ((hour == 10 && min >= 45) || (hour == 11 && min < 45)) {
          ret = "2 1";
        } else if ((hour == 11 && min >= 45) || (hour == 12 && min < 45)) {
          ret = "2 2";
        } else if ((hour == 12 && min >= 45) || (hour == 13 && min < 30)) {
          ret = "Break";
        } else if ((hour == 13 && min >= 30) || (hour == 14 && min < 30)) {
          ret = "2 3";
        } else if ((hour == 14 && min >= 30) || (hour == 15 && min < 30)) {
          ret = "2 4";
        } else if ((hour == 15 && min >= 30) && (hour == 15 && min < 45)) {
          ret = "Break";
        } else if ((hour == 15 && min >= 45) || (hour == 16 && min < 45)) {
          ret = "2 5";
        } else if ((hour == 16 && min >= 45) || (hour == 17 && min < 45)) {
          ret = "2 6";
        }
        break;

      case 3:
        if (hour <= 10 && min <= 45) {
          ret = "-1";
        } else if ((hour == 17 && min >= 45) || (hour > 17)) {
          ret = "0";
        } else if ((hour == 10 && min >= 45) || (hour == 11 && min < 45)) {
          ret = "3 1";
        } else if ((hour == 11 && min >= 45) || (hour == 12 && min < 45)) {
          ret = "3 2";
        } else if ((hour == 12 && min >= 45) || (hour == 13 && min < 30)) {
          ret = "Break";
        } else if ((hour == 13 && min >= 30) || (hour == 14 && min < 30)) {
          ret = "3 3";
        } else if ((hour == 14 && min >= 30) || (hour == 15 && min < 30)) {
          ret = "3 4";
        } else if ((hour == 15 && min >= 30) && (hour == 15 && min < 45)) {
          ret = "Break";
        } else if ((hour == 15 && min >= 45) || (hour == 16 && min < 45)) {
          ret = "3 5";
        } else if ((hour == 16 && min >= 45) || (hour == 17 && min < 45)) {
          ret = "3 6";
        }
        break;

      case 4:
        if (hour <= 10 && min <= 45) {
          ret = "-1";
        } else if ((hour == 17 && min >= 45) || (hour > 17)) {
          ret = "0";
        } else if ((hour == 10 && min >= 45) || (hour == 11 && min < 45)) {
          ret = "4 1";
        } else if ((hour == 11 && min >= 45) || (hour == 12 && min < 45)) {
          ret = "4 2";
        } else if ((hour == 12 && min >= 45) || (hour == 13 && min < 30)) {
          ret = "Break";
        } else if ((hour == 13 && min >= 30) || (hour == 14 && min < 30)) {
          ret = "4 3";
        } else if ((hour == 14 && min >= 30) || (hour == 15 && min < 30)) {
          ret = "4 4";
        } else if ((hour == 15 && min >= 30) && (hour == 15 && min < 45)) {
          ret = "Break";
        } else if ((hour == 15 && min >= 45) || (hour == 16 && min < 45)) {
          ret = "4 5";
        } else if ((hour == 16 && min >= 45) || (hour == 17 && min < 45)) {
          ret = "4 6";
        }
        break;

      case 5:
        if (hour <= 10 && min <= 45) {
          ret = "-1";
        } else if ((hour == 17 && min >= 45) || (hour > 17)) {
          ret = "0";
        } else if ((hour == 10 && min >= 45) || (hour == 11 && min < 45)) {
          ret = "5 1";
        } else if ((hour == 11 && min >= 45) || (hour == 12 && min < 45)) {
          ret = "5 2";
        } else if ((hour == 12 && min >= 45) || (hour == 13 && min < 30)) {
          ret = "Break";
        } else if ((hour == 13 && min >= 30) || (hour == 14 && min < 30)) {
          ret = "5 3";
        } else if ((hour == 14 && min >= 30) || (hour == 15 && min < 30)) {
          ret = "5 4";
        } else if ((hour == 15 && min >= 30) && (hour == 15 && min < 45)) {
          ret = "Break";
        } else if ((hour == 15 && min >= 45) || (hour == 16 && min < 45)) {
          ret = "5 5";
        } else if ((hour == 16 && min >= 45) || (hour == 17 && min < 45)) {
          ret = "5 6";
        }
        break;

      case 6:
        ret = "6";
        break;
      case 7:
        ret = "7";
        break;
    }
  }
}
