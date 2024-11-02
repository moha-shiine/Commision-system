import 'package:flutter/material.dart';
// ignore: unused_import
import 'app/home/views/home.dart';
import 'app/login/views/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          //LoginViews()
          AdminDashboard(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: <Widget>[
            NavigationRail(
              selectedIndex: 0,
              //   groupAlignment: groupAlignment,
              // onDestinationSelected: (int index) {
              //   setState(() {
              //     //  _selectedIndex = index;
              //   });
              // },

              destinations: const <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.favorite_border),
                  label: Text('First'),
                ),
                NavigationRailDestination(
                  icon: Badge(child: Icon(Icons.bookmark_border)),
                  label: Text('Second'),
                ),
                NavigationRailDestination(
                  icon: Badge(
                    label: Text('4'),
                    child: Icon(Icons.star_border),
                  ),
                  label: Text('Third'),
                ),
              ],
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
