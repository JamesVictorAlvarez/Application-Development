import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';
import 'package:sample/Model.dart';
import 'package:sample/Service.dart';
import 'package:sqflite/sqflite.dart';
import 'package:async/async.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DatabaseHelper handler;

  Future<int> addPlanets() async {
    Planets first =
        Planets(id: 1, name: 'Mercury', age: 8901, distanceFromSun: 345612362);
    Planets second =
        Planets(id: 2, name: 'Venus', age: 791231, distanceFromSun: 04616251);
    Planets third = Planets(
        id: 3, name: 'Earth', age: 1254435, distanceFromSun: 4610367571);
    Planets fourth =
        Planets(id: 4, name: 'Mars', age: 785431, distanceFromSun: 74104561936);

    List<Planets> planets = [first, second, third, fourth];
    return await handler.insertPlanets(planets);
  }

  @override
  void initState() {
    super.initState();
    handler = DatabaseHelper();
    handler.initializedDB().whenComplete(() async {
      await addPlanets();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: handler.retrievePlanets(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Planets>> snapShot) {
            if (snapShot.hasData) {
              return ListView.builder(
                itemCount: snapShot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      contentPadding: EdgeInsets.all(10.0),
                      title: Text(snapShot.data![index].name),
                      subtitle: Text(snapShot.data![index].age.toString()),
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
