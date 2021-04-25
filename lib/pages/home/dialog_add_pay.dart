import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay69/pages/home/scr_home.dart';
import 'package:pay69/widgets/lable_checkbox.dart';

import 'ctr_home.dart';
import 'member.dart';

class DialogAddPay extends StatelessWidget {
  final ctrHome = Get.put(CtrHome());
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Thêm các khoản đã thanh toán'),
      content: Container(
        width: Get.width / 1.2,
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Obx(
                  () => DropdownButton<String>(
                    dropdownColor: Colors.white,
                    value: ctrHome.member.value.nameCode == null
                        ? "0"
                        : ctrHome.member.value.nameCode,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 16,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 1,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String newVal) {
                      ctrHome.choosePayMember(newVal);
                    },
                    items: memberList
                        .map<DropdownMenuItem<String>>((Member member) {
                      return DropdownMenuItem<String>(
                        value: member.nameCode,
                        child: Text(member.fullName),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            // Row(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.only(top: 16, bottom: 8),
            //       child: Text("Chọn người sẽ chịu thanh toán"),
            //     )
            //   ],
            // ),
            Obx(
              () => ctrHome.member.isBlank
                  ? Container()
                  : ListBody(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 8),
                          child: Text("Chọn người sẽ chịu thanh toán"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              LabeledCheckbox(
                                label: memberList[1].fullName,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                value: ctrHome.checkbox[0],
                                onChanged: (bool newValue) {
                                  ctrHome.checkbox[0] = newValue;
                                  ctrHome.setDebitMember(
                                      newValue, memberList[1].nameCode);
                                },
                              ),
                              LabeledCheckbox(
                                label: memberList[2].fullName,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                value: ctrHome.checkbox[1],
                                onChanged: (bool newValue) {
                                  ctrHome.checkbox[1] = newValue;
                                  ctrHome.setDebitMember(
                                      newValue, memberList[2].nameCode);
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              LabeledCheckbox(
                                label: memberList[3].fullName,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                value: ctrHome.checkbox[2],
                                onChanged: (bool newValue) {
                                  ctrHome.checkbox[2] = newValue;
                                  ctrHome.setDebitMember(
                                      newValue, memberList[3].nameCode);
                                },
                              ),
                              LabeledCheckbox(
                                label: memberList[4].fullName,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                value: ctrHome.checkbox[3],
                                onChanged: (bool newValue) {
                                  ctrHome.checkbox[3] = newValue;
                                  ctrHome.setDebitMember(
                                      newValue, memberList[4].nameCode);
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              LabeledCheckbox(
                                label: memberList[5].fullName,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                value: ctrHome.checkbox[4],
                                onChanged: (bool newValue) {
                                  ctrHome.checkbox[4] = newValue;
                                  ctrHome.setDebitMember(
                                      newValue, memberList[5].nameCode);
                                },
                              ),
                              LabeledCheckbox(
                                label: memberList[6].fullName,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                value: ctrHome.checkbox[5],
                                onChanged: (bool newValue) {
                                  ctrHome.checkbox[5] = newValue;
                                  ctrHome.setDebitMember(
                                      newValue, memberList[6].nameCode);
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            //controller: questionCtr.explainController,
                            onChanged: (text) {
                              ctrHome.setMoney(text);
                              // ctrHome.money = int.parse(text);
                            },
                            cursorColor: Colors.deepPurpleAccent,
                            maxLines: null,
                            decoration: InputDecoration(
                                labelText: 'Nhập số tiền đã thanh toán'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            //controller: questionCtr.explainController,
                            onChanged: (text) {
                              ctrHome.comments = text;
                            },
                            cursorColor: Colors.deepPurpleAccent,
                            minLines: 2,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(labelText: 'Chú thích'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 8),
                          child: Text(
                            '${ctrHome.message}',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
            ),

            // Nội dung giải thích
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              ctrHome.clearFrom();
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
            child: Text("Hủy")),
        ElevatedButton(
            onPressed: () async {
              ctrHome.save();
            },
            child: Text("Lưu")),
      ],
    );
  }
}
