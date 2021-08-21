import 'dart:convert';
import 'package:enie_production/screens/nav_bar.dart';
import 'package:enie_production/screens/recovery_password.dart';
import 'package:enie_production/screens/register_screen.dart';
import 'package:enie_production/widgets/login_btn.dart';
import 'package:enie_production/widgets/retry_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = new GlobalKey<FormState>();
  bool _isLoading = false;
  void initState() {
    super.initState();
    userID();
  }
  String _username, _password;
  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    var usernameField = TextFormField(
        validator: (value) => value.isEmpty ? "กรุณากรอกหมายเลขโทรศัพท์" : null,
        keyboardType: TextInputType.phone,
        controller: usernameController,
        inputFormatters: [
          LengthLimitingTextInputFormatter(10),
        ],
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.phone,
            color: HexColor('#36803a'),
          ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ));

    final passwordField = TextFormField(
      controller: passwordController,
      autofocus: false,
      obscureText: true,
      validator: (value) => value.isEmpty ? "Please enter password" : null,
      onSaved: (value) => _password = value,
      decoration: buildInputDecoration("Confirm password", Icons.lock),
    );

    final forgotLabel = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(
          padding: EdgeInsets.all(0.0),
          child: Text("Forgot password?",
              style: TextStyle(fontWeight: FontWeight.w300)),
          onPressed: () {
            recoveryPassword(context);
          },
        ),
        FlatButton(
          padding: EdgeInsets.only(left: 0.0),
          child: Text("Sign up", style: TextStyle(fontWeight: FontWeight.w300)),
          onPressed: () {
            signUpPage(context);
          },
        ),
      ],
    );

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false, //remove warnning pixel
        body: Container(
          padding: EdgeInsets.all(40),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                  width: 10,
                ),
                Center(
                  child: Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/enie-89c82.appspot.com/o/logo%2Fenie_logo.png?alt=media&token=ab317673-0576-4557-8f1f-bbf0b8313e56',
                      width: 200,
                      height: 105,
                      fit: BoxFit.fitHeight),
                ),
                SizedBox(height: 20.0),
                label("Phone Number"),
                SizedBox(height: 10.0),
                usernameField,
                SizedBox(height: 20.0),
                label("Password"),
                SizedBox(height: 10.0),
                passwordField,
                SizedBox(height: 20.0),
                buttonSection(),
                SizedBox(height: 5.0),
                forgotLabel,
              ],
            ),
          ),
        ),
      ),
    );
  }
  void signUpPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Register()),
    );
  }
  void recoveryPassword(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RecoveryPassword()),
    );
  }
  userID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // setState(() {
    //   usernameController.text = "adasdadad";
    // });
    prefs.setString('username', usernameController.text);
    print(_username);
  }

  signIn(String username, pass) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = {"strategy": "local", 'username': username, 'password': pass};

    var jsonResponse = null;
    var userID = username;
    final response = await http.post(
      Uri.parse("https://app1.fantasy.co.th/authentication"),
      body: data,
    );
    if (response.statusCode == 401) {
      print("401");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RetryLogin()),
      );
    } else {
      jsonResponse = json.decode(response.body);
      prefs.setString("accessToken", jsonResponse['accessToken']);
      // prefs.setString("userID", username);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) => NavBar(username: username)),
          (Route<dynamic> route) => false);
      print(jsonResponse);
    }
  }
  Container buttonSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.only(top: 15.0),
      child: RaisedButton(
        color: Colors.green,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        onPressed:
            usernameController.text == "" || passwordController.text == ""
                ? null
                : () {
                    setState(() {
                      _isLoading = true;
                    });
                    signIn(usernameController.text, passwordController.text);
                    userID();
                  },
        elevation: 0.0,
        child: Text("Sign In", style: TextStyle(color: Colors.white70)),
      ),
    );
  }
}