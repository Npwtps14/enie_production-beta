import 'dart:convert';
import 'package:enie_production/screens/address/district_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'dart:convert' as convert;

import '../register_screen.dart';

class ProvincesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(child: ProvincesListView()),
    ));
  }
}

class GetProvinces {
  int id;
  String province;
  String email;
  int phoneNumber;

  GetProvinces({this.id, this.province, this.email, this.phoneNumber});

  factory GetProvinces.fromJson(Map<String, dynamic> json) {
    return GetProvinces(
        id: json['id'],
        province: json['province_name_th'],
        email: json['province_name_en'],
        phoneNumber: json['province_status']);
  }
}

// class Cate32 extends StatefulWidget {
//   final cate;
//   final cateId;
//   const Cate32({String this.cate, String this.cateId});
//   @override
//   Cate32State createState() => new Cate32State();
// }
class ProvincesListView extends StatefulWidget {
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
  final provinceID;
  final districtID;
  final subDistrictId;
  final zipCode;
  final salonImg;

  const ProvincesListView(
      {this.phoneNumber,
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
      this.provinceID,
      this.districtID,
      this.subDistrictId,
      this.zipCode,
      this.salonImg, userName});

  @override
  Provinces createState() => Provinces();
}

class Provinces extends State<ProvincesListView> {
  Future<List<GetProvinces>> _getProvinceList() async {
    var url = Uri.parse('https://app1.fantasy.co.th/provinces');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonItems = json.decode(response.body).cast<Map<String, dynamic>>();
      List<GetProvinces> provinceList = jsonItems.map<GetProvinces>((json) {
        return GetProvinces.fromJson(json);
      }).toList();

      return provinceList;
    } else {
      throw Exception('Failed to load data from internet');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เลือกจังหวัด',style: GoogleFonts.kanit(),),
        backgroundColor: HexColor('#36803a'),
      ),
      body: Container(
        child: FutureBuilder<List<GetProvinces>>(
          future: _getProvinceList(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            return ListView(
              children: snapshot.data
                  .map(
                    (dataProvince) => ListTile(
                      title: Text(dataProvince.province,style: GoogleFonts.kanit(),),
                      onTap: () {
                        var province = new MaterialPageRoute(
                          builder: (BuildContext contex) => DistrictsListView(
                            provinceID: dataProvince.id,
                            province:dataProvince.province,
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
                            alleyname: widget.alley,
                            road: widget.road,
                           
                          ),
                        );

                        Navigator.of(context).push(province);
                       
                      },
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
      ),
    );
  }
}
