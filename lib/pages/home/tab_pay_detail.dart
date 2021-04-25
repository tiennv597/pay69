
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ctr_home.dart';

class TabPayHomeScr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GetX<CtrHome>(
            init: Get.put<CtrHome>(CtrHome()),
            builder: (CtrHome CtrHome) {
              if (CtrHome != null && CtrHome.payList.length != 0) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: CtrHome.payList.length,
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
                                          CtrHome.payList[index].payer +
                                              " chi " +
                                              CtrHome.payList[index].money.toString(),
                                          style: TextStyle(fontSize: 24.0),
                                        ),
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          CtrHome.payList[index].comments,
                                          style: TextStyle(fontSize: 18.0),
                                        ),
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          CtrHome.payList[index].debit.toString(),
                                          style: TextStyle(fontSize: 18.0),
                                        ),
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          CtrHome.payList[index].date
                                              .toDate()
                                              .toString(),
                                          style: TextStyle(fontSize: 18.0),
                                        ),
                                      )),
                                ],
                              )
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



