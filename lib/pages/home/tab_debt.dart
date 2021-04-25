import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ctr_home.dart';

class TabDebtHomeScr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GetX<CtrHome>(
            init: Get.put<CtrHome>(CtrHome()),
            builder: (CtrHome CtrHome) {
              if (CtrHome != null && CtrHome.debitList.length != 0) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: CtrHome.debitList.length,
                    itemBuilder: (_, index) {
                      return Card(
                          child: Column(
                        children: <Widget>[
                          Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  CtrHome.debitList[index].payer,
                                  style: TextStyle(fontSize: 24.0),
                                ),
                              )),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Tổng chi: " +
                                      CtrHome.debitList[index].expense
                                          .toString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                              )),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Tổng tiêu: " +
                                      CtrHome.debitList[index].permoney
                                          .toString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                              ))
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  CtrHome.debitList[index].debit
                                      .toString()
                                      .toString(),
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              )),
                            ],
                          ),
                        ],
                      ));
                      ;
                    },
                  ),
                );
              } else {
                return Text("loading...");
              }
            },
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// ListView.builder(
// itemBuilder: (context, int index) => GestureDetector(
// onTap: () {
// print("object");
// },
// child: Padding(
// padding: const EdgeInsets.symmetric(horizontal: 16),
// child: Card(
// child: ClipRRect(
// child: Row(
// mainAxisSize: MainAxisSize.max,
// children: <Widget>[
// Padding(
// padding: const EdgeInsets.all(4.0),
// child: Container(
// height: 20,
// width: 20,
// decoration: BoxDecoration(
// shape: BoxShape.circle,
// ),
// child: CircleAvatar(
// child: new Text((index + 1).toString()),
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(4.0),
// child: Text(""),
// ),
// Padding(
// padding: const EdgeInsets.all(4.0),
// child: Text(""),
// )
// ],
// ),
// ),
// ),
// ),
// ),
// itemCount: snapshot.data.length,
// );
