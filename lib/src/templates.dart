// To parse this JSON data, do
//
//     final brewMethod = brewMethodFromJson(jsonString);
import 'dart:convert';

List<BrewMethod> brewMethodFromJson(String str) =>
    List<BrewMethod>.from(json.decode(str).map((x) => BrewMethod.fromJson(x)));

String brewMethodToJson(List<BrewMethod> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BrewMethod {
  BrewMethod({
    required this.id,
    required this.title,
    required this.ratio,
    required this.temp,
    required this.grind,
    required this.steps,
  });

  int id;
  String title;
  double ratio;
  int temp;
  String grind;
  List<String> steps;

  factory BrewMethod.fromJson(Map<String, dynamic> json) => BrewMethod(
        id: json["id"],
        title: json["title"],
        ratio: json["ratio"].toDouble(),
        temp: json["temp"],
        grind: json["grind"],
        steps: List<String>.from(json["steps"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "ratio": ratio,
        "temp": temp,
        "grind": grind,
        "steps": List<dynamic>.from(steps.map((x) => x)),
      };
}
