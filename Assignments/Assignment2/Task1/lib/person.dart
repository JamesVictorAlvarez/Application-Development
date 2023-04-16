import 'DBHelper.dart';

class Person {
  int? personID;
  String? firstName;
  String? lastName;

  Person(this.personID, this.firstName, this.lastName);

  Person.fromMap(Map<String, dynamic> map) {
    personID = map['personID'];
    firstName = map['lastName'];
    lastName = map['firstName'];
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columnPersonID: personID,
      DatabaseHelper.columnFirstName: firstName,
      DatabaseHelper.columnLastName: lastName
    };
  }
}