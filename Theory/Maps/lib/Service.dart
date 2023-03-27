import './Model.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Future<Database> initializedDB() async {
    String path = await getDatabasesPath();
    return openDatabase(join(path, 'planets.db'), version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
        'create table planets (id integer primary key, name text not null,'
        'age integer not null, distanceFromSun integer not null)',
      );
    });
  }

  // Insert data
  Future<int> insertPlanets(List<Planets> planets) async {
    int result = 0;
    final Database db = await initializedDB();
    for (var planet in planets) {
      result = await db.insert('planets', planet.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
    }
    return result;
  }

  // Retrieve data
  Future<List<Planets>> retrievePlanets() async {
    final Database db = await initializedDB();
    final List<Map<String, Object?>> queryResult = await db.query('planets');
    return queryResult.map((e) => Planets.fromMap(e)).toList();
  }
}
