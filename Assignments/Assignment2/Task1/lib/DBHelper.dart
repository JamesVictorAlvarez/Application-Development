import './Person.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  static final _databaseName = "persondb.db";
  static final _databaseVersion = 1;

  static final table = 'person_table';

  static final columnPersonID = 'personID';
  static final columnFirstName = 'firstName';
  static final columnLastName = 'lastName';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnPersonID INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnFirstName TEXT NOT NULL,
            $columnLastName TEXT NOT NULL
          )
          ''');
  }

  Future<int> insert(Person person) async {
    Database db = await instance.database;
    return await db.insert(table, {'firstName': person.firstName, 'lastName': person.lastName});
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<int> update(Person person) async {
    Database db = await instance.database;
    int id = person.toMap()['personID'];
    return await db.update(table, person.toMap(), where: '$columnPersonID = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnPersonID = ?', whereArgs: [id]);
  }
}