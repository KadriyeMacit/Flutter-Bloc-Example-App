import 'dart:convert';

HomeCardModel homeCardModelFromJson(String str) =>
    HomeCardModel.fromJson(json.decode(str));

class HomeCardModel {
  HomeCardModel({
    required this.data,
  });

  final Data data;

  factory HomeCardModel.fromJson(Map<String, dynamic> json) => HomeCardModel(
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    required this.yogaTypes,
  });

  final List<YogaType> yogaTypes;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        yogaTypes: List<YogaType>.from(
            json["yoga_types"].map((x) => YogaType.fromJson(x))),
      );
}

class YogaType {
  YogaType({
    required this.name,
    required this.image,
  });

  final String name;
  final String image;

  factory YogaType.fromJson(Map<String, dynamic> json) => YogaType(
        name: json["name"],
        image: json["image"],
      );
}
