import 'dart:convert';

import 'package:enie_production/screens/address/sub_district_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'dart:convert' as convert;

import '../register_screen.dart';

class DistrictsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(child: DistrictsListView()),
    ));
  }
}

class GetDistricts {
  int id;
  String name;
  String email;
  // int provinceID;
  int phoneNumber;

  GetDistricts({this.id, this.name, this.email, this.phoneNumber});

  factory GetDistricts.fromJson(Map<String, dynamic> json) {
    return GetDistricts(
        id: json['id'],
        name: json['district_name_th'],
        email: json['district_name_en'],
        phoneNumber: json['district_status']);
  }
}

class DistrictsListView extends StatefulWidget {
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
  final alleyname;
  final road;
  final countryID;
  final districtID;
  final subDistrictId;
  final zipCode;
  final salonImg;
  final province;

  const DistrictsListView(
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
      this.alleyname,
      this.road,
      this.countryID,
      this.districtID,
      this.subDistrictId,
      this.zipCode,
      this.salonImg,
      this.province});
  Districts createState() => Districts();
}

class Districts extends State<DistrictsListView> {
  Future<List<GetDistricts>> _getDistrictsList() async {
    var url = Uri.parse(
        'https://app1.fantasy.co.th/districts?province_id=${widget.provinceID}');
    var response = await http.get(url);
    // print('จังหวัด' + widget.provinceID.toString());
    if (response.statusCode == 200) {
      final jsonItems = json.decode(response.body).cast<Map<String, dynamic>>();

      List<GetDistricts> districtList = jsonItems.map<GetDistricts>((json) {
        return GetDistricts.fromJson(json);
      }).toList();

      return districtList;
    } else {
      throw Exception('Failed to load data from internet');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เลือกอำเภอ',style: GoogleFonts.kanit(),),
        backgroundColor: HexColor('#36803a'),
      ),
      body: FutureBuilder<List<GetDistricts>>(
        future: _getDistrictsList(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return ListView(
            children: snapshot.data
                .map(
                  (dataDistrict) => ListTile(
                    title: Text(dataDistrict.name,style: GoogleFonts.kanit(),),
                    onTap: () {
                      var district = new MaterialPageRoute(
                        builder: (BuildContext contex) => SubDistrictListView(
                          districtID: dataDistrict.id,
                          districtName:dataDistrict.name,
                          provinceID: widget.provinceID,
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
                          alley: widget.alleyname,
                          road: widget.road,
                          countryID: widget.countryID,
                          province:widget.province,
                          // districtID: ,
                          // subDistrictId: ,
                          // zipCode: ,
                          salonImg: widget.salonImg,
                        ),
                      );
                      Navigator.of(context).push(district);
                    },
                    // subtitle: Text(widget.provinceID.toString()),
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
