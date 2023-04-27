import 'dart:convert';

List<Model> userModelFromJson(String str) =>
    List<Model>.from(json.decode(str).map((x) => Model.fromJson(x)));

String userModelToJson(List<Model> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Model {
  Model({
    required this.id,
    required this.type,
    required this.name,
    required this.batters,
    required this.topping,
  });

  int id;
  String type;
  String name;
  Batters batters;
  Topping topping;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    id: json["id"],
    type: json["type"],
    name: json["name"],
    batters: Batters.fromJson(json["batters"]),
    topping: Topping.fromJson(json["topping"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "name": name,
    "batters": batters.toJson(),
    "topping": topping.toJson(),
  };
}

class Batters {
  Batters({
    required this.batter
  });

  Batter batter;

  factory Batters.fromJson(Map<String, dynamic> json) => Batters(
    batter: Batter.fromJson(json["batter"]),
  );

  Map<String, dynamic> toJson() => {
    "batter": batter.toJson(),
  };
}

class Batter {
  Batter({
    required this.id,
    required this.type,
  });

  int id;
  String type;

  factory Batter.fromJson(Map<String, dynamic> json) => Batter(
    id: json["id"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
  };
}

class Topping {
  Topping({
    required this.id,
    required this.type,
  });

  int id;
  String type;

  factory Topping.fromJson(Map<String, dynamic> json) => Topping(
    id: json["id"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
  };
}