import 'package:enie_production/screens/chat_screen.dart';
import 'package:enie_production/screens/home_screen.dart';
import 'package:enie_production/screens/promotion.dart';
import 'package:enie_production/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'category_screen.dart';
import 'login_screen.dart';

class NavBar extends StatefulWidget {
  // NavBar({Key key, String username}) : super(key: key);
  final username;

  const NavBar({this.username});

  @override
  NavBarState createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  SharedPreferences sharedPreferences;
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("accessToken") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => Login()),
          (Route<dynamic> route) => false);
    }
  }

  int selectedIndex = 0;
  final widgetOptions = [
    new HomePage(),
    new CategoryPage(),
    new PromotionPage(),
    new UsersPage(),
    new ChatPage()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return new Future(() => false);
      },
      child: Scaffold(
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   title: Text('Enie store'),
        //   backgroundColor: HexColor('#36803a'),
        // ),
        body: Center(
          child: widgetOptions.elementAt(selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            // ignore: deprecated_member_use
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                // ignore: deprecated_member_use
                icon: Icon(Icons.shopping_bag),
                title: Text('Shop')),
            BottomNavigationBarItem(
                // ignore: deprecated_member_use
                icon: Icon(Icons.favorite),
                title: Text('Promotion')),
            BottomNavigationBarItem(
                // ignore: deprecated_member_use
                icon: LineIcon(LineIcons.userCircle),
                title: Text('Profile')),
            BottomNavigationBarItem(
                // ignore: deprecated_member_use
                icon: LineIcon(LineIcons.facebookMessenger),
                title: Text('Chat')),
          ],
          currentIndex: selectedIndex,
          unselectedItemColor: Colors.black,
          fixedColor: Colors.deepPurple,
          onTap: onItemTapped,
          backgroundColor: Colors.purpleAccent,
        ),
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
