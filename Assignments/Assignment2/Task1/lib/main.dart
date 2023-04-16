import 'package:flutter/material.dart';

import './Person.dart';
import './DBHelper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DB - Flutter',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dbHelper = DatabaseHelper.instance;

  List<Person> persons = [];

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int index = -1;

  void _showMessageInScaffold(String message){
      SnackBar(content: Text(message));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        /*--------------------------App Bar--------------------------*/
        appBar: AppBar(
          title: Text('Task1'),
        ),
        /*--------------------------App Bar--------------------------*/

        /*---------------------------Body---------------------------*/
        body: Column(
          children: [
            Container(
              width: 350,
              child: TextField(
                controller: firstNameController,
                decoration: InputDecoration(
                  hintText: 'First Name',
                ),
              ),
            ),
            Container(
              width: 350,
              child: TextField(
                controller: lastNameController,
                decoration: InputDecoration(
                  hintText: 'Last Name',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 165,
                  child: ElevatedButton(
                    onPressed: () {
                      String firstName = firstNameController.text;
                      String secondName = lastNameController.text;
                      _insert(firstName, secondName);
                      _queryAll();
                      firstNameController.clear();
                      lastNameController.clear();
                    },
                    child: Text('ADD'),
                  ),
                ),
                Container(
                  width: 165,
                  child: ElevatedButton(
                    onPressed: () {
                      String firstName = firstNameController.text;
                      String lastName = lastNameController.text;
                      if (index != -1) { // check if an item is selected
                        int personId = persons[index].personID!;
                        _update(personId, lastName, firstName);
                        _queryAll();
                        firstNameController.clear();
                        lastNameController.clear();
                        setState(() {
                          index = -1; // reset the index after updating
                        });
                      } else {
                        _showMessageInScaffold('Please select an item to update');
                      }
                    },
                    child: Text('UPDATE'),
                  ),
                ),
              ],
            ),
            Container(
              width: 350,
              child: Divider(
                thickness: 2,
                color: Colors.blue,
              ),
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: persons.length,
                  itemBuilder: (context, int index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text('${persons[index].firstName} ${persons[index].lastName}'),
                          trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    firstNameController.text = persons[index].firstName ?? '';
                                    lastNameController.text = persons[index].lastName ?? '';
                                    setState(() {
                                      this.index = index;
                                    });
                                  },
                                  child: Image.asset(
                                    'images/edit.png',
                                    width: 25,
                                    height: 25,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _delete(persons[index].personID);
                                    _queryAll();
                                  },
                                  child: Image.asset(
                                    'images/delete.png',
                                    width: 25,
                                    height: 25,
                                  ),
                                ),
                                SizedBox(width: 16,)
                              ],
                          ),
                        ),
                        Container(
                          width: 350,
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
        /*---------------------------Body---------------------------*/
      ),
    );
  }

  void _insert(firstName, lastName) async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnFirstName: firstName,
      DatabaseHelper.columnLastName: lastName
    };
    Person person = Person.fromMap(row);
    final id = await dbHelper.insert(person);
    _showMessageInScaffold('inserted row id: $id');
  }


  void _queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    persons.clear();
    allRows.forEach((row) => persons.add(Person.fromMap(row)));
    setState(() {});
  }

  void _update(id, firstName, lastName) async {
    Person person = Person(id, firstName, lastName);
    final rowsAffected = await dbHelper.update(person);
  }

  void _delete(id) async {
    final rowsDeleted = await dbHelper.delete(id);
  }
}


