import 'package:enie_production/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutPage extends StatefulWidget {
  @override
  ConfirmLogout createState() => ConfirmLogout();
}

class ConfirmLogout extends State<LogoutPage> {
  SharedPreferences sharedPreferences;
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }
  @override
  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("accessToken") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => Login()),
          (Route<dynamic> route) => false);
    }
  }
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Warning', style: GoogleFonts.kanit(color: Colors.red)),
      content: Text(
        'คุณกำลังจะออกจากระบบ',
        style: GoogleFonts.kanit(),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('ยืนยัน', style: GoogleFonts.kanit(color: Colors.green)),
          onPressed: () {
            sharedPreferences.clear();
            sharedPreferences.commit();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (BuildContext context) => Login()),
                (Route<dynamic> route) => false);
         
          },
        ),
        FlatButton(
          child: Text(
            'ยกเลิก',
            style: GoogleFonts.kanit(color: Colors.red),
          ),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    );
  }
}
