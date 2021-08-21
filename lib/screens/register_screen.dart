import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:enie_production/screens/address/provinces_screen.dart';
import 'package:enie_production/screens/login_screen.dart';
import 'package:enie_production/services/auth_service.dart';
import 'package:enie_production/widgets/login_btn.dart';
import 'package:enie_production/widgets/register_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cart_screen.dart';

class Register extends StatefulWidget {
  final subDistrictName;
  final province;
  final provinceID;
  final phoneNumber;
  final password;
  final confirmPassword;
  final salonName;
  final sloneLastName;
  final salonNickName;
  final salonStoreName;
  final email;
  final address;
  final village;
  final alley;
  final road;
  final countryID;
  final subDistrictId;
  final zipCode;
  final salonImg;
  final districtName;
  final districtID;

  const Register(
      {this.subDistrictName = '',
      this.province = '',
      this.phoneNumber,
      this.password = '',
      this.confirmPassword,
      this.salonName = '',
      this.sloneLastName = '',
      this.salonNickName = '',
      this.salonStoreName = '',
      this.email = '',
      this.address = '',
      this.village = '',
      this.alley = '',
      this.road = '',
      this.countryID,
      this.subDistrictId,
      this.zipCode = '',
      this.salonImg,
      this.provinceID,
      this.districtName = '',
      this.districtID});
  @override
  _RegisterState createState() => _RegisterState();
}

SharedPreferences prefs;

class _RegisterState extends State<Register> {
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
      "salon_main_picture": base64Img.trim().toString(),
      "salon_id_card": null,
      "username": widget.phoneNumber,
      "email": widget.email,
      "email_verified_at": null,
      "password": widget.password,
      "remember_token": "-",
      "sale_id": 12,
      "salon_type": 1,
      "salon_contract_name":
          "${widget.salonName + "  " + widget.sloneLastName}",
      "salon_web_code": null,
      "salon_name": widget.salonStoreName,
      "salon_phone": widget.phoneNumber,
      "salon_phone2": "-",
      "salon_address": widget.address,
      "salon_village": widget.village,
      "salon_alley": widget.alley,
      "salon_road": widget.road,
      "country_id": 1,
      "province_id": widget.provinceID,
      "district_id": widget.districtID,
      "subdistrict_id": widget.subDistrictId,
      "salon_zip_code": widget.zipCode,
      "salon_credit_limited": 10000,
      "salon_due_total": 0,
      "salon_order_total": 0,
      "salon_pay_total": 0,
      "salon_point": 0,
      "salon_scope": 0,
      "salon_qty": 0,
      "salon_last_order": null,
      "salon_avatar": null,
      "salon_logo": "-",
      "salon_slogan": "-",
      "salon_keyword": null,
      "salon_line_id": null,
      "salon_facebook": null,
      "salon_ig": null,
      "salon_youtube": null,
      "salon_url": "-",
      "salon_latitude": "-",
      "salon_open_time": null,
      "salon_close_time": null,
      "salon_status": 0,
      "salon_hot": 0,
      "salon_on_website": 0,
      "salon_token_line": null,
      "salon_persuader": null,
      "created_by": 0,
      "updated_by": 1,
      "salon_gen": 0
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

    usernameController.text = widget.phoneNumber;
    passwordContorller.text = widget.password;
    nameController.text = widget.salonName;
    lastNameController.text = widget.sloneLastName;
    storeNameController.text = widget.salonStoreName;
    emailController.text = widget.email;
    addressController.text = widget.address;
    villageController.text = widget.village;
    roadController.text = widget.road;
    alleyController.text = widget.alley;

    var usernameField = TextFormField(
        // autofocus: true,
        // initialValue: widget.phoneNumber,
        validator: (value) => value.isEmpty ? "กรุณากรอกหมายเลขโทรศัพท์" : null,
        controller: usernameController,
        onSaved: (value) => _username = value,
        keyboardType: TextInputType.phone,
        inputFormatters: [
          LengthLimitingTextInputFormatter(10),
        ],
        decoration: InputDecoration(
          hintText: widget.phoneNumber,
          prefixIcon: Icon(
            Icons.phone,
            color: HexColor('#36803a'),
          ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ));

    final passwordField = TextFormField(
        // autofocus: true,
        obscureText: true,
        controller: passwordContorller,
        validator: (value) => value.isEmpty ? "Please enter password" : null,
        onSaved: (value) => _password = value,
        decoration: InputDecoration(
          hintText: widget.password,
          prefixIcon: Icon(
            Icons.lock,
            color: HexColor('#36803a'),
          ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ));

    // final confirmPassword = TextFormField(
    //   autofocus: false,
    //   validator: (value) => value.isEmpty ? "Your password is required" : null,
    //   onSaved: (value) => _confirmPassword = value,
    //   obscureText: true,
    //   decoration: buildInputDecoration("Confirm password", Icons.lock),
    // );

    final salonsName = TextFormField(
        // autofocus: true,
        controller: nameController,
        validator: (val) => val.isEmpty ? "กรุณากรอกข้อมูลให้ครบถ้วน" : null,
        decoration: InputDecoration(
          hintText: widget.salonName,
          prefixIcon: Icon(
            Icons.person,
            color: HexColor('#36803a'),
          ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ));
    final salonsLastName = TextFormField(
        // autofocus: true,
        controller: lastNameController,
        validator: (val) => val.isEmpty ? "กรุณากรอกข้อมูลให้ครบถ้วน" : null,
        decoration: InputDecoration(
          hintText: widget.sloneLastName,
          prefixIcon: Icon(
            Icons.person,
            color: HexColor('#36803a'),
          ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ));
    final salonsStoreName = TextFormField(
        controller: storeNameController,
        // autofocus: true,
        validator: (val) => val.isEmpty ? "กรุณากรอกข้อมูลให้ครบถ้วน" : null,
        decoration: InputDecoration(
          hintText: widget.salonStoreName,
          prefixIcon: Icon(
            Icons.store,
            color: HexColor('#36803a'),
          ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ));
    final email = TextFormField(
        controller: emailController,
        // autofocus: true,
        validator: (val) => val.isEmpty ? "กรุณากรอกข้อมูลให้ครบถ้วน" : null,
        decoration: InputDecoration(
          hintText: widget.email,
          prefixIcon: Icon(
            Icons.mail,
            color: HexColor('#36803a'),
          ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ));
    final address = TextFormField(
        controller: addressController,
        // autofocus: true,
        validator: (val) => val.isEmpty ? "กรุณากรอกข้อมูลให้ครบถ้วน" : null,
        decoration: InputDecoration(
          hintText: widget.address,
          prefixIcon: Icon(
            Icons.pin_drop,
            color: HexColor('#36803a'),
          ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ));
    final village = TextFormField(
        controller: villageController,
        // autofocus: true,
        validator: (val) => val.isEmpty ? "กรุณากรอกข้อมูลให้ครบถ้วน" : null,
        decoration: InputDecoration(
          hintText: widget.village,
          prefixIcon: Icon(
            Icons.pin_drop,
            color: HexColor('#36803a'),
          ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ));
    final alley = TextFormField(
        controller: alleyController,
        // autofocus: true,
        validator: (val) => val.isEmpty ? "กรุณากรอกข้อมูลให้ครบถ้วน" : null,
        decoration: InputDecoration(
          hintText: widget.alley,
          prefixIcon: Icon(
            Icons.pin_drop,
            color: HexColor('#36803a'),
          ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ));
    final road = TextFormField(
        controller: roadController,
        // autofocus: true,
        validator: (val) => val.isEmpty ? "กรุณากรอกข้อมูลให้ครบถ้วน" : null,
        decoration: InputDecoration(
          hintText: widget.road,
          prefixIcon: Icon(
            Icons.pin_drop,
            color: HexColor('#36803a'),
          ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ));
    final country_id = TextFormField(
      readOnly: true,
      // autofocus: true,
      validator: (val) => val.isEmpty ? "กรุณากรอกข้อมูลให้ครบถ้วน" : null,
      decoration: buildInputDecoration("", Icons.map),
      initialValue: "ประเทศไทย",
    );
    final salonImg = Center(
      child: RaisedButton(
        color: Colors.blueAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {
          // if (formKey.currentState.validate())
          pickImg();
        },
        child: Text(
          "เลือกรูปภาพ",
          style: GoogleFonts.kanit(color: Colors.white),
        ),
      ),
    );
    
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
            'สมัครสมาชิก',
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
                  label("หมายเลขโทรศัพท์"),
                  SizedBox(height: 10.0),
                  usernameField,
                  SizedBox(height: 20.0),
                  label("รหัสผ่าน"),
                  SizedBox(height: 10.0),
                  passwordField,
                  // SizedBox(height: 20.0),
                  // label("ยืนยันรหัสผ่าน"),
                  // SizedBox(height: 10.0),
                  // confirmPassword,
                  SizedBox(height: 10.0),
                  label("ชื่อ"),
                  SizedBox(height: 10.0),
                  salonsName,
                  SizedBox(height: 10.0),
                  label("นามสกุล"),
                  SizedBox(height: 10.0),
                  salonsLastName,
                  SizedBox(height: 10.0),
                  label("ชื่อร้าน"),
                  SizedBox(height: 10.0),
                  salonsStoreName,
                  SizedBox(height: 10.0),
                  label("Email"),
                  SizedBox(height: 10.0),
                  email,
                  SizedBox(height: 10.0),
                  label("ที่อยู่"),
                  SizedBox(height: 10.0),
                  address,
                  SizedBox(height: 10.0),
                  label("หมู่ที่"),
                  SizedBox(height: 10.0),
                  village,
                  SizedBox(height: 10.0),
                  label("ซอย"),
                  SizedBox(height: 10.0),
                  alley,
                  SizedBox(height: 10.0),
                  label("ถนน"),
                  SizedBox(height: 10.0),
                  road,
                  SizedBox(height: 10.0),
                  label("ประเทศ"),
                  SizedBox(height: 10.0),
                  country_id,
                  SizedBox(height: 10.0),
                  label("กรุณาระบุรายละเอียดที่อยู่"),
                  SizedBox(height: 5.0),
                  TextFormField(
                    readOnly: true,
                    initialValue: widget.province,
                    validator: (val) => val.isEmpty ? "ระบุจังหวัด" : null,
                    decoration: InputDecoration(
                      hintText: "แตะเพื่อเลือกจังหวัด",
                      prefixIcon: Icon(
                        Icons.pin_drop,
                        color: HexColor('#36803a'),
                      ),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: GoogleFonts.kanit(),
                    onTap: () {
                      var addressPush = new MaterialPageRoute(
                        builder: (BuildContext contex) => ProvincesListView(
                          phoneNumber: usernameController.text,
                          password: passwordContorller.text,
                          // confirmPassword: confirmPassword,
                          salonName: nameController.text,
                          sloneLastName: lastNameController.text,
                          salonStoreName: storeNameController.text,
                          email: emailController.text,
                          address: addressController.text,
                          village: villageController.text,
                          alley: alleyController.text,
                          road: roadController.text,
                          countryID: country_id,
                        ),
                      );
                      Navigator.of(context).push(addressPush);
                    },
                  ),
                  SizedBox(height: 5.0),
                  TextFormField(
                    readOnly: true,
                    initialValue: widget.districtName,
                    validator: (val) => val.isEmpty ? "no data" : null,
                    decoration: InputDecoration(
                      hintText: "อำเภอ",
                      prefixIcon: Icon(
                        Icons.pin_drop,
                        color: HexColor('#36803a'),
                      ),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: GoogleFonts.kanit(),
                  ),
                  SizedBox(height: 5.0),
                  TextFormField(
                    readOnly: true,
                    initialValue: widget.subDistrictName,
                    validator: (val) => val.isEmpty ? "no data" : null,
                    decoration: InputDecoration(
                      hintText: "ตำบล",
                      prefixIcon: Icon(
                        Icons.pin_drop,
                        color: HexColor('#36803a'),
                      ),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: GoogleFonts.kanit(),
                  ),
                  SizedBox(height: 5.0),
                  TextFormField(
                    readOnly: true,
                    initialValue: widget.zipCode,
                    validator: (val) => val.isEmpty ? "no data" : null,
                    decoration: InputDecoration(
                      hintText: "รหัสไปรษณีย์",
                      prefixIcon: Icon(
                        Icons.pin_drop,
                        color: HexColor('#36803a'),
                      ),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: GoogleFonts.kanit(),
                  ),
                  SizedBox(height: 10.0),
                  SizedBox(height: 10.0),
                  label("รูปหน้าร้าน"),
                  Card(
                    child: Container(
                      height: 300,
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: file == null
                          ? Center(child: Text('เลือกรูปภาพหน้าร้าน'))
                          : Image.file(
                              file,
                              width: 300,
                              height: 150,
                              fit: BoxFit.fitHeight,
                            ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  salonImg,
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
                        "สมัครสมาชิก",
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
