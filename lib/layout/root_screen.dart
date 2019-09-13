import 'package:flutter/material.dart';
import 'package:timesheet/layout/constants.dart';
import 'package:timesheet/main.dart';

class RootScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(strings[appStrings.appTitle], key: Key('welcomeText')),),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
              title: Text('Home'),
              icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              title: Text('More'),
              icon: Icon(Icons.more_horiz)
          )
        ]),
        body: Center(
            child: HomeScreen()
        ));
  }
}
