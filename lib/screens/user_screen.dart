import 'package:enie_production/screens/recovery_password.dart';
import 'package:enie_production/screens/update_user.dart';
import 'package:enie_production/widgets/confirm_logout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cart_screen.dart';
import 'login_screen.dart';

String username = '';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
    userID();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("accessToken") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => Login()),
          (Route<dynamic> route) => false);
    }
  }

  userID() async {
    sharedPreferences = await SharedPreferences.getInstance();

    return username;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: HexColor('#36803a'),
        // title: Text(""),
        leading: GestureDetector(),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: IconButton(
                  icon: LineIcon(LineIcons.shoppingCart),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
                  }),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(children: <Widget>[
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      color: HexColor('#ffffff'),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Image.network(
                      "https://e7.pngegg.com/pngimages/799/987/png-clipart-computer-icons-avatar-icon-design-avatar-heroes-computer-wallpaper.png",
                      fit: BoxFit.cover),
                ),
                SizedBox(width: 15.0),
                Expanded(
                  child: Container(
                    height: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "สวัสดีคุณ,",
                          style: TextStyle(
                              color: HexColor('#000000'),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Nupawat",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: HexColor('#000000')),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RaisedButton(
                          child: Text(
                            'อัพเดทข้อมูล',
                            style: GoogleFonts.kanit(),
                          ),
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePage()),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                )
              ]),
              Text(
                "Setting",
                style: TextStyle(
                    color: Color(0xff242424),
                    fontSize: 28,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                      decoration: BoxDecoration(
                          color: Color(0xffFBB97C),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                  color: Color(0xffFBB97C),
                                  borderRadius: BorderRadius.circular(16)),
                              child: RaisedButton(
                                child: Text(
                                  'ออกจากระบบ',
                                  style: GoogleFonts.kanit(),
                                ),
                                color: Colors.redAccent,
                                textColor: Colors.white,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LogoutPage()),
                                  );
                                },
                              )),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                      decoration: BoxDecoration(
                          color: Color(0xffFBB97C),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                  color: Color(0xffFBB97C),
                                  borderRadius: BorderRadius.circular(0)),
                              child: RaisedButton(
                                child: Text(
                                  'เปลี่ยนรหัสผ่าน',
                                  style: GoogleFonts.kanit(),
                                ),
                                color: Colors.blue,
                                textColor: Colors.white,
                                onPressed: () {},
                              )),
                          SizedBox(
                            width: 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

void gotoNextActivity(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Login()),
  );
}

class IconTile extends StatelessWidget {
  final String imgAssetPath;
  final Color backColor;

  IconTile({this.imgAssetPath, this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: backColor, borderRadius: BorderRadius.circular(15)),
        child: Image.asset(
          imgAssetPath,
          width: 20,
        ),
      ),
    );
  }
}
