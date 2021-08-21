import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:enie_production/screens/login_screen.dart';
import 'package:enie_production/widgets/login_btn.dart';
import 'package:enie_production/widgets/register_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecoveryPassword extends StatefulWidget {   
  @override
  _RegisterState createState() => _RegisterState();
}
SharedPreferences prefs;
class _RegisterState extends State {
  final formKey = new GlobalKey<FormState>();
  final picker = ImagePicker();
  File file;
  var dio = Dio();
  Future postRegister() async {
    // String imageFileName = file.path.split("/").last;
    // List<int> imageBytes =  file.readAsBytesSync();
    // String  base64Image = base64Encode(imageBytes);
    final image = file.readAsBytesSync();
    String base64Img = base64Encode(image);
    // var x = base64Img.s;
    final String pathUrl = 'https://app1.fantasy.co.th/salons';
    var userData = {     
    };
    var response = await dio.post(pathUrl,
        data: userData,
        options: Options(headers: {
          'Content-type': 'application/json',
        }));
    if (response.statusCode == 200) {
      return response.data;
    }
    if (response.statusCode == 500) {
      print("status code 500");
    } else {
      print('base 64 img = $base64Img ');
    }
    // show error message
    // response.statusCode == 500 ;
  }

  Future pickImg() async {
    var pickedImg = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      file = File(pickedImg.path);
    });
  }

  String _password, _confirmPassword, _username;
  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordContorller = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController storeNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController villageController = TextEditingController();
    TextEditingController alleyController = TextEditingController();
    TextEditingController roadController = TextEditingController();

    void hideKeyboard(BuildContext context) {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
        FocusManager.instance.primaryFocus.unfocus();
      }
    }
    var usernameField = TextFormField(
        // autofocus: true,
        // initialValue: widget.phoneNumber,
        validator: (value) => value.isEmpty ? "กรุณากรอกหมายเลขโทรศัพท์ หรือ E-mail" : null,
        controller: usernameController,
        onSaved: (value) => _username = value,
        keyboardType: TextInputType.phone,
        inputFormatters: [
          LengthLimitingTextInputFormatter(10),
        ],
        decoration: InputDecoration(
          // hintText: widget.phoneNumber,
          prefixIcon: Icon(
            Icons.phone,
            color: HexColor('#36803a'),
          ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ));

  
    final backtologinLabel = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(
          padding: EdgeInsets.all(0.0),
          child: Text("Back to Signin page",
              style: TextStyle(fontWeight: FontWeight.w300)),
          onPressed: () {
            gotoLogin(context);
          },
        ),
      ],
    );
    return WillPopScope(
      onWillPop: () {
        return new Future(() => false);
      },
      child: Scaffold(
        backgroundColor: HexColor('#ffffff'),
        resizeToAvoidBottomInset: false, //remove warnning pixel
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'กู้รหัสผ่าน',
            style: GoogleFonts.kanit(),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            child: Icon(
              Icons.arrow_back, // add custom icons also
            ),
          ),
          backgroundColor: HexColor('#36803a'),
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.all(40),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.0),
                  label("หมายเลขโทรศัพท์ หรือ E-mail"),
                  SizedBox(height: 10.0),
                  usernameField,
                  SizedBox(height: 10.0),
                 
                  SizedBox(height: 20.0),
                  ButtonTheme(
                    height: 45,
                    minWidth: 600,
                    child: RaisedButton(
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      // onPressed: () {
                      //   print('');
                      // },

                      onPressed: () async {
                        if (formKey.currentState.validate())
                          await postRegister().then((value) {
                            print(value);
                            var registerSuccess = new MaterialPageRoute(
                              builder: (BuildContext contex) =>
                                  RegisterSuccess(),
                            );
                            Navigator.of(context).push(registerSuccess);
                          });
                      },
                      child: Text(
                        "recovery password",
                        style: GoogleFonts.kanit(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  backtologinLabel,
                  SizedBox(height: 360.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
void gotoLogin(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Login()),
  );
}
