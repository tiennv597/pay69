import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pay69/pages/home/member.dart';
import 'package:pay69/pages/home/model/model_debit.dart';
import 'package:pay69/pages/home/model/model_pay.dart';

class CtrHome extends GetxController {
  var member = new Member().obs;
  var message = ''.obs;
  FirebaseFirestore _db = FirebaseFirestore.instance;
  var checkbox = [false, false, false, false, false, false].obs;
  int money;
  var comments;
  var debit = [];
  RxList<ModelPay> payList = new RxList<ModelPay>();
  RxList<ModelDebit> debitList = new RxList<ModelDebit>();

  @override
  void onInit() {
    payList.bindStream(payStream()); //stream coming from firebase
    debitList.bindStream(debitStream());
  }

  choosePayMember(String newVal) {
    member.update((val) {
      val.nameCode = newVal;
    });
  }

  setMoney(String m) {
    try {
      money = int.parse(m);
      return true;
    } catch (e) {
      message.update((val) {
        message.value = 'Tiền phải nhập số và lớn hơn 0 nhé';
      });
      print(e.toString());
      return false;
    }
  }

  Stream<List<ModelPay>> payStream() {
    return _db
        .collection("pay69detail")
        .orderBy('date', descending: true)
        .limit(100)
        .snapshots()
        .map((QuerySnapshot query) {
      List<ModelPay> retVal = List();
      query.docs.forEach((element) {
        retVal.add(ModelPay.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  Future<void> updateDebit(ModelDebit debit, String uid) async {
    try {
      await _db.collection("pay69").doc(uid).update({
        'debit': debit.debit,
        'expense': debit.expense,
        'permoney': debit.permoney,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<List<ModelDebit>> debitStream() {
    return _db.collection("pay69").snapshots().map((QuerySnapshot query) {
      List<ModelDebit> retVal = List();
      query.docs.forEach((element) {
        retVal.add(ModelDebit.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  setDebitMember(bool check, String nameCode) {
    if (check) {
      debit.add(nameCode);
    } else {
      debit.remove(nameCode);
    }
  }

  bool save() {
    if (member.value.nameCode != null &&
        debit.length != 0 &&
        money != null &&
        comments != null) {
      try {
        firebaseSavePay(
          payer: member.value.nameCode,
          money: money,
          date: new DateTime.now(),
          comments: comments,
          debit: debit,
        );

        Get.back();
        splitMoney(member.value.nameCode, money, debit, debitList);
        clearFrom();
        return true;
      } catch (e) {
        print(e.toString());
        return false;
      }
    } else {
      if (member.value.nameCode == null) {
        message.update((val) {
          message.value = 'Quên chọn người thanh toán rồi kìa?';
        });
      } else if (debit.length == 0) {
        message.update((val) {
          message.value = 'Không chọn người chịu thanh toán à?';
        });
      } else if (money == null) {
        message.update((val) {
          message.value = 'Tiền phải nhập số và lớn hơn 0 nhé';
        });
      } else if (comments == null) {
        message.update((val) {
          message.value = 'Có mỗi cái chú thích mà cũng quên';
        });
      }
    }
  }

  clearFrom() {
    money = null;
    comments = null;
    debit = [];
    member = new Member().obs;
    message = ''.obs;
    checkbox = [false, false, false, false, false, false].obs;
  }

  splitMoney(
      String payer, int money, List debit, RxList<ModelDebit> debitDetail) {
    int split = money;
    bool checkusing = false;
    for (int i = 0; i < debit.length; i++) {
      if (payer == debit[i]) {
        split = (split / debit.length).ceil();
        checkusing = true;
        break;
      }
    }
    if (checkusing == false) {
      split = (split / (debit.length - 1)).round();
    }

    debitDetail.forEach((element) {
      if (element.payer == payer) {
        element.expense = element.expense + money;
        element.permoney = element.permoney + split;
        for (int i = 0; i < debit.length; i++) {
          element.debit.forEach((key, value) {
            if (debit[i] == key) {
              element.debit.update(key, (v) {
                return v + split;
              });
              // value. = value + split;
            }
          });
        }
      } else {
        for (int i = 0; i < debit.length; i++) {
          if (debit[i] == element.payer) {
            element.debit.forEach((key, value) {
              if (payer == key) {
                element.permoney = element.permoney - split;
                element.debit.update(key, (v) {
                  return v - split;
                });
              }
            });
          }
        }
      }
      print(element.payer +
          "chi " +
          element.expense.toString() +
          "tiêu " +
          element.permoney.toString());
      print(element.debit);
      updateDebit(element, element.payer);
    });
  }

  void firebaseSavePay({
    String id,
    var payer,
    int money,
    DateTime date,
    String comments,
    List debit,
  }) {
    _db.collection("pay69detail").doc(id).set({
      "payer": payer,
      "money": money,
      "debit": debit,
      "date": date,
      "comments": comments,
    });
  }
}
