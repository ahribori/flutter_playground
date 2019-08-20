import 'package:flutter/material.dart';
import 'pages/Home.dart';
import 'pages/About.dart';
import 'pages/RandomWord.dart';
import 'pages/GeoLocation.dart';
import 'pages/Sensor.dart';
import 'pages/SMS.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  Widget _selectedWidget = Home();
  Map<String, Widget> _routeMap = {
    '/home': Home(),
    '/about': About(),
    '/random_words': RandomWords(),
    '/geolocation': GeoLocation(),
    '/sensor': Sensor(),
    '/sms': SMS(),
  };
  List<String> _bottomNavigationRouteList = [
    '/home',
    '/about',
    '/random_words',
    '/geolocation',
    '/sensor',
    '/sms'
  ];

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _selectedWidget = _routeMap[_bottomNavigationRouteList[index]];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Playground',
      theme: ThemeData(primaryColor: Colors.deepPurpleAccent, accentColor: Colors.deepPurpleAccent),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Playground'),
        ),
        drawer: Builder(
            builder: (context) => Drawer(
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                        title: Text('Home'),
                        onTap: () {
                          setState(() {
                            _selectedWidget = _routeMap['/home'];
                          });
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: Text('About'),
                        onTap: () {
                          setState(() {
                            _selectedWidget = _routeMap['/about'];
                          });
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: Text('Random Words'),
                        onTap: () {
                          setState(() {
                            _selectedWidget = _routeMap['/random_words'];
                          });
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: Text('Geolocation'),
                        onTap: () {
                          setState(() {
                            _selectedWidget = _routeMap['/geolocation'];
                          });
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: Text('Sensor'),
                        onTap: () {
                          setState(() {
                            _selectedWidget = _routeMap['/sensor'];
                          });
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: Text('SMS'),
                        onTap: () {
                          setState(() {
                            _selectedWidget = _routeMap['/sms'];
                          });
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                )),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              title: Text('About'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
        body: Center(
          child: _selectedWidget,
        ),
      ),
    );
  }
}
