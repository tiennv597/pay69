import 'package:flutter/material.dart';
import 'package:pay69/pages/home/tab_debt.dart';
import 'package:pay69/pages/home/tab_pay_detail.dart';

class HomeScrTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Text("Các Khoản thanh toán"),
                Text("Chi tiết nợ nần"),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              TabPayHomeScr(),
              TabDebtHomeScr(),
            ],
          ),
        ),
      ),
    );
  }
}
