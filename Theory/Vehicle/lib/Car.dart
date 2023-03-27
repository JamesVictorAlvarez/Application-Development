import 'DBHelper.dart';

class Car {
  int? id;
  String? name;
  int? miles;
  String? color;

  Car(this.id, this.name, this.miles, this.color);

  Car.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    miles = map['miles'];
    color = map['color'];
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columnId: id,
      DatabaseHelper.columnName: name,
      DatabaseHelper.columnMiles: miles,
      DatabaseHelper.columnColor: color,
    };
  }
}