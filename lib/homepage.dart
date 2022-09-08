import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:xoso77/constants.dart';

import 'page_one.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    PageOne(
      title: 'Quay thử miền Bắc ngày ${DateTimeFormat()}',
    ),
    PageOne(
      title: 'Quay thử miền Nam ngày ${DateTimeFormat()}',
    ),
    PageOne(
      title: 'Quay thử miền Trung ngày ${DateTimeFormat()}',
    ),
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 14, 20, 136),
        title: Image.asset(
          "assets/icon.png",
          width: 128,
        ),
      ),
      body: Center(
        child: HomePage._widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kPrimaryColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Quay thử MB',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Quay thử MN',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Quay thử MT',
          ),
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
