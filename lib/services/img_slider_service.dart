import 'package:enie_production/models/slider.dart';
import 'package:http/http.dart' as http;
import 'dart:async';


class ImgSliderService {
  static var client = http.Client();

   static Future<List<ImgSlider>> fetchSlider() async {
    // var response = await client.get(
    //     'https://mf-salon-api.herokuapp.com/img-slider');
    // if (response.statusCode == 200) {
    //   var jsonString = response.body;
    //   return sliderFromJson(jsonString);
    // } else {
      //show error message   
      return null;
    // }
  }
}
