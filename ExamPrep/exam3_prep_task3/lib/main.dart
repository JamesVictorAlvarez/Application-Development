import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

void main() => runApp(
  MaterialApp(
    title: 'App',
    home: MyApp(),
  )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task2'),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
              child: Icon(Icons.mail),
              label: 'one',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ImagesList()),
                );
              },
          ),
          SpeedDialChild(
              child: Icon(Icons.account_circle),
              label: 'two',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ImagesList()),
                );
              }
          ),
        ],
      ),
    );
  }
}

class ImagesList extends StatelessWidget {

  final List<String> imageNames = [
    '1.jpeg',
    '2.jpeg',
    '3.jpeg',
    '4.jpeg',
    '5.jpeg',
    '6.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Grid'),
        ),
        body: GridView.count(
          crossAxisCount: 3, // Number of columns
          children: List.generate(
            imageNames.length,
                (index) =>
                Container(
                    padding: EdgeInsets.all(8),
                    child: Image.asset(
                      'assets/images/${imageNames[index]}',
                      fit: BoxFit.cover,
                    )
                ),
          ),
        ),
      )
    );
  }
}

