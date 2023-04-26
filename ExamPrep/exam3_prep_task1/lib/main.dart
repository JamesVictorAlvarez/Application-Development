import 'package:flutter/material.dart';

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
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String username = 'test';

  String get getUsername => username;
  final String password = '123';

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _validateInput(BuildContext context) {
    if (_usernameController.text == username &&
        _passwordController.text == password) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ListPage(),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Invalid Credentials'),
          content: Text('Please enter valid username and password'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Assignment1'),
            backgroundColor: Colors.grey,
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: FlutterLogo(
                  size: 100,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Login ID',
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _validateInput(context),
                child: Text('LOGIN'),
              ),
            ],
          ),
          backgroundColor: Colors.white24),
    );
  }
}

class ListPage extends StatelessWidget {
  _MyHomePageState home = _MyHomePageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assignement1'),
      ),
      body: Column(
        children: [
          Container(
            child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    home.getUsername,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )),
          ),
          Container(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'List of Hotels',
                style: TextStyle(
                  fontSize: 45,
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(right: 40, left: 40),
              child: Divider(
                thickness: 2,
              ),
            ),
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/hotel1.jpeg',
                height: 200,
                width: 200,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoPage(),
                      ),
                    );
                  },
                  child: Text('Click for info'),
                ),
              ),
            ],
          )
        ],
      ),
      backgroundColor: Colors.white24,
    );
  }
}

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final TextEditingController _customerController = TextEditingController();
    final TextEditingController _nightController = TextEditingController();

    _MyHomePageState home = _MyHomePageState();
    return Scaffold(
      appBar: AppBar(
        title: Text('Assignement1'),
      ),
      body: Column(
        children: [
          Container(
            child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    home.getUsername,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )),
          ),
          Container(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Details and Booking',
                style: TextStyle(
                  fontSize: 45,
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(right: 40, left: 40),
              child: Divider(
                thickness: 2,
              ),
            ),
          ),
          Image.asset(
            'assets/images/hotel1.jpeg',
            width: 350,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('100 Cad Per Night'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: _customerController,
              decoration: InputDecoration(
                labelText: 'Enter the no of Customer',
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: _nightController,
              decoration: InputDecoration(
                labelText: 'Enter number of Nights',
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              int num1 = int.parse(_nightController.text);
              int result = num1 * 100;
              Navigator.push(
                  context,
                MaterialPageRoute(
                    builder: (context) => ResultPage(result: result),
                ),
              );
            },
            child: Text('Check Out'),
          ),
        ],
      ),
      backgroundColor: Colors.white24,
    );
  }
}

class ResultPage extends StatelessWidget {
  final int result;

  ResultPage({required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Page'),
      ),
      body: Center(
        child: Text(
          'The result is $result',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
