import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import './product_list_screen.dart';
import './single_product_screen.dart';

// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Splash Screen',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: MyHomePage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   void initState() {
//     super.initState();
//     Timer(
//         Duration(seconds: 3),
//         () => Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => SecondScreen())));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: FlutterLogo(
//         size: MediaQuery.of(context).size.height,
//       ),
//     );
//   }
// }
//
// class SecondScreen extends StatelessWidget {
//   const SecondScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('SuperFlash'),),
//       body: Center(
//         child: Text(
//           'This is the demo page after Splash screen',
//           textScaleFactor: 2,
//         ),
//       ),
//     );
//   }
// }

/*---------------------------------------------------------------------------------------------------------------*/
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   double _fontSize = 20;
//
//   void increaseFontSize() {
//     setState(() {
//       _fontSize = 40;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Center(
//             child: Text('Flutter Simple Animation'),
//           ),
//         ),
//         body: ListView(
//           children: <Widget>[
//             Container(
//               margin: EdgeInsets.all(20),
//               child: Text(
//                 'Hey there, today is sunny but too cod and'
//                 'enjoy the flutter lab',
//                 style: TextStyle(fontSize: _fontSize),
//               ),
//             ),
//             RaisedButton(
//               onPressed: () => {increaseFontSize()},
//               child: Text('Bigger font'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

/*---------------------------------------------------------------------------------------------------------------*/
//
// void main() {
//   return runApp(MaterialApp(
//     home: Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: Text('Dice Demo'),
//         backgroundColor: Color.fromRGBO(15, 157, 88, 1),
//       ),
//       body: Dice(),
//     ),
//   ));
// }
//
// class Dice extends StatefulWidget {
//   const Dice({Key? key}) : super(key: key);
//
//   @override
//   State<Dice> createState() => _DiceState();
// }
//
// class _DiceState extends State<Dice> {
//
//   int dice_no = 1;
//   void update() {
//     setState(() {
//       //Random.nextInt(n) returns random integer from 0 to n-1
//       dice_no = Random().nextInt(6) + 1;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Expanded(
//         child: Padding(
//           padding: EdgeInsets.all(50.0),
//           child: FlatButton(
//             child: Image.asset('images/dice$dice_no.png'),
//             onPressed: () {
//               update();
//             }
//           ),
//         ),
//       ),
//     );
//   }
// }

/*---------------------------------------------------------------------------------------------------------------*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Data Passing for Container",
      home: ProductListScreen(),
      routes: {
        "single-product" : (context) => SingleProductScreen(),
      }
    );
  }
}




