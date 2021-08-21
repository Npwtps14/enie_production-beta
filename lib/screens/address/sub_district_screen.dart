import 'dart:convert';

import 'package:enie_production/screens/address/district_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'dart:convert' as convert;

import '../register_screen.dart';

class SubDistrictScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(child: SubDistrictListView()),
    ));
  }
}

class GetSubDistrict {
  int id;
  String dName;
  String email;
  String dNumber;

  GetSubDistrict({this.id, this.dName, this.email, this.dNumber});

  factory GetSubDistrict.fromJson(Map<String, dynamic> json) {
    return GetSubDistrict(
        id: json['id'],
        dName: json['sub_district_name_th'],
        email: json['sub_district_name_en'],
        dNumber: json['sub_district_zip_code'] ??= '');
  }
}

// class Cate32 extends StatefulWidget {
//   final cate;
//   final cateId;
//   const Cate32({String this.cate, String this.cateId});
//   @override
//   Cate32State createState() => new Cate32State();
// }
class SubDistrictListView extends StatefulWidget {
  final districtID;
  final provinceID;
  final province;
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
  const SubDistrictListView(
      {this.provinceID,
      this.phoneNumber,
      this.password,
      this.confirmPassword,
      this.salonName,
      this.sloneLastName,
      this.salonNickName,
      this.salonStoreName,
      this.email,
      this.address,
      this.village,
      this.alley,
      this.road,
      this.countryID,
      this.districtID,
      this.subDistrictId,
      this.zipCode,
      this.salonImg,
      this.province,
      this.districtName});
  SubDistrict createState() => SubDistrict();
}

class SubDistrict extends State<SubDistrictListView> {
  Future<List<GetSubDistrict>> _getSubDistrictList() async {
    var url = Uri.parse(
        'https://app1.fantasy.co.th/sub-districts?district_id=${widget.districtID}');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonItems = json.decode(response.body).cast<Map<String, dynamic>>();

      List<GetSubDistrict> usersList = jsonItems.map<GetSubDistrict>((json) {
        return GetSubDistrict.fromJson(json);
      }).toList();

      return usersList;
    } else {
      throw Exception('Failed to load data from internet');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'เลือกตำบล/เขต',
          style: GoogleFonts.kanit(),
        ),
        backgroundColor: HexColor('#36803a'),
      ),
      body: FutureBuilder<List<GetSubDistrict>>(
        future: _getSubDistrictList(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return ListView(
            children: snapshot.data
                .map(
                  (user) => ListTile(
                    title: Text(
                      user.dName,
                      style: GoogleFonts.kanit(),
                    ),
                    onTap: () {
                      var province = new MaterialPageRoute(
                        builder: (BuildContext contex) => Register(
                          provinceID: widget.provinceID,
                          subDistrictName: user.dName,
                          districtName: widget.districtName,
                          province: widget.province,
                          phoneNumber: widget.phoneNumber,
                          password: widget.password,
                          confirmPassword: widget.confirmPassword,
                          salonName: widget.salonName,
                          sloneLastName: widget.sloneLastName,
                          salonNickName: widget.salonNickName,
                          salonStoreName: widget.salonStoreName,
                          email: widget.email,
                          address: widget.address,
                          village: widget.village,
                          alley: widget.alley,
                          road: widget.road,
                          countryID: widget.countryID,
                          districtID: widget.districtID,
                          subDistrictId: user.id,
                          zipCode: user.dNumber,
                          salonImg: widget.salonImg,
                        ),
                      );
                      Navigator.of(context).push(province);
                    },
                    subtitle: Text(
                      'รหัสไปรษณีย์  ' + user.dNumber,
                      style: GoogleFonts.kanit(),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: LineIcon(LineIcons.mapMarker),
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
