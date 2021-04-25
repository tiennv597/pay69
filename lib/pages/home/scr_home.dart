import 'package:flutter/material.dart';
import 'package:pay69/pages/home/tabbar.dart';

import 'dialog_add_pay.dart';

class ScrHome extends StatelessWidget {
  int _counter = 0;

  void _incrementCounter() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScrTabBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => DialogAddPay());
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
