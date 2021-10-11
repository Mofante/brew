class BrewMethod {
  int id;
  String title;
  double ratio;
  int temp;
  String grind;
  List<String> steps;

  BrewMethod(
      {this.id, this.title, this.ratio, this.temp, this.grind, this.steps});

  BrewMethod.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    ratio = json['ratio'];
    temp = json['temp'];
    grind = json['grind'];
    steps = json['steps'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['ratio'] = this.ratio;
    data['temp'] = this.temp;
    data['grind'] = this.grind;
    data['steps'] = this.steps;
    return data;
  }
}
