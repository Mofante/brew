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
  List<Step> steps;

  factory BrewMethod.fromJson(Map<String, dynamic> json) => BrewMethod(
        id: json["id"],
        title: json["title"],
        ratio: json["ratio"].toDouble(),
        temp: json["temp"],
        grind: json["grind"],
        steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "ratio": ratio,
        "temp": temp,
        "grind": grind,
        "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
      };
}

class Step {
  Step({
    required this.textA,
    required this.textB,
    required this.coffee,
    required this.timer,
  });

  String textA;
  String textB;
  double coffee;
  int timer;

  factory Step.fromJson(Map<String, dynamic> json) => Step(
        textA: json["textA"],
        textB: json["textB"],
        coffee: json["coffee"] == null ? null : json["coffee"].toDouble(),
        timer: json["timer"] == null ? null : json["timer"],
      );

  Map<String, dynamic> toJson() => {
        "textA": textA,
        "textB": textB,
        "coffee": coffee == null ? null : coffee,
        "timer": timer == null ? null : timer,
      };
}
