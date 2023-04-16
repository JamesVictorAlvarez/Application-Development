import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 2',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    ProfilePage(),
    NotificationsPage(),
    SettingsPage(),
    LogOut(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('My Application'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepOrange,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterLogo(
                    size: 70,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Flutter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: () {
                setState(() {
                  _currentIndex = 3;
                  Navigator.pop(context);
                });
              },
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex],
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 150,
                height: 160,
                child: Image(
                  image: AssetImage('images/Kermit.jpg'),
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                        decoration: InputDecoration(labelText: 'Name')),
                    TextFormField(
                        decoration: InputDecoration(labelText: 'Real Name')),
                    TextFormField(
                        decoration: InputDecoration(labelText: 'Team')),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed "
            "tempor urna a libero lobortis, ut mollis libero ultrices. Nam ac"
            "sollicitudin turpis, vel lobortis justo. Fusce id urna vitae "
            "lacus luctus dignissim. Donec convallis, lorem vel faucibus "
            "scelerisque, velit velit aliquet risus, vel feugiat sapien "
            "tellus ac libero. Nam sit amet fringilla nibh. Donec non faucibus"
            " sapien, quis bibendum mauris. In porttitor, dolor eu consequat"
            " interdum, odio ex blandit sapien, eget gravida velit elit",
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Divider(
            thickness: 2,
            color: Colors.grey,
          ),
        ),
      ],
    ));
  }
}

class NotificationsPage extends StatelessWidget {
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: TableCalendar(
          focusedDay: today,
          firstDay: DateTime.utc(2020, 10, 16),
          lastDay: DateTime.utc(2030, 3, 12),
        ))
      ],
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings UI'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Common',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Language'),
              subtitle: Text('English'),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.cloud),
              title: Text('Environment'),
              subtitle: Text('Production'),
            ),
            SizedBox(height: 16),
            Text(
              'Account',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone Number'),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text('Email'),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sign out'),
            ),
            SizedBox(height: 16),
            Text(
              'Security',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.orange,
              ),
            ),
            SwitchListTile(
              secondary: Icon(Icons.phonelink_lock_sharp),
              title: Text('Lock app in background'),
              value: true,
              onChanged: (bool value) {},
            ),
          ],
        ),
      ),
    );
  }
}

class LogOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('LogOut'),
    );
  }
}
