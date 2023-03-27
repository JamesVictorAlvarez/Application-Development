import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';


void main() async {
  // We have to import the package 'package:flutter/widgets.dart'

  WidgetsFlutterBinding.ensureInitialized();

  // Open the database
  final database = openDatabase(
    /*
    'join' function from the path package is best practice to ensure
    path is correctly constructed for the db platform
    */
    join(await getDatabasesPath(), 'doggie_database.db'),
    // When the database is first created, create a table to store dogs
    onCreate: (db, version) {
      return db.execute(
        'create table dogs (id integer primary key, name text, age integer)',
      );
    },
    version: 1,
  );

  // Define a funcion that inserts dogs to the db
  Future<void> insertDog(Dog dog) async {
    // Get a reference to the database
    final db = await database;
    /*
     Insert the dog to the correct table. Please include conflictAlgorithm
     to use in case the same dog is inserted twice
     */
    await db.insert('dogs', dog.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // A method to retrieve all the dogs from the table
  Future<List<Dog>> dogs() async {
    final db = await database;

    // Query the table
    final List<Map<String, dynamic>> maps = await db.query('dogs');

    // Convert the List<Map<String, dynamic>> into a List<Dog>
    return List.generate(maps.length, (i) {
      return Dog(id: maps[i]['id'], name: maps[i]['name'], age: maps[i]['age']);
    });
  }

  // A method to update the table
  Future<void> updateDog(Dog dog) async {
    final db = await database;
    await db.update(
      'dogs',
      dog.toMap(),
      where: 'id = ?',
      whereArgs: [dog.id],
    );
  }

  // A method to delete the table item
  Future<void> deleteDog(int id) async {
    final db = await database;
    await db.delete(
      'dogs',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Create a dog instance and add to the table
  var fido = const Dog(id: 0, name: 'Fide', age: 8);
  await insertDog(fido);

  var cat = const Dog(id: 1, name: 'Cat', age: 2);
  await insertDog(cat);

  // Use the retrieve method
  print(await dogs());

  // Print fido's age and save it to the db
  fido = Dog(
    id: fido.id,
    name: fido.name,
    age: fido.age + 3,
  );
  await updateDog(fido);
  print(await dogs());

  // Delete an object from the db
  // await deleteDog(cat.id);
}

class Dog {
  final int id;
  final String name;
  final int age;

  const Dog({
    required this.id,
    required this.name,
    required this.age,
  });

  // Convert a Dog into a map. The keys must correspond to the names of
  // columns in the database

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}
