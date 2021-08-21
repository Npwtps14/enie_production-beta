import 'dart:convert';


List<ImgSlider> sliderFromJson(String str) =>
    List<ImgSlider>.from(json.decode(str).map((x) => ImgSlider.fromJSON(x)));

String sliderToJson(List<ImgSlider> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJSON())));
class ImgSlider {
  int id;
  String imgURL;
  String createdAt;
  String updatedAt;

  ImgSlider({
    this.id,
    this.imgURL,
    this.createdAt,
    this.updatedAt,
  });

  factory ImgSlider.fromJSON(Map<String, dynamic> json) => ImgSlider(
    id: json["id"],
    imgURL: json["imgUrl"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
  );

  Map<String, dynamic> toJSON() => {
    "id": id,
    "imgUrl": imgURL,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}