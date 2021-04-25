import 'package:cloud_firestore/cloud_firestore.dart';

class ModelPay {
  static const ID = "id";
  static const PAYER = "payer";
  static const MONEY = "money";
  static const DEBIT = "debit";
  static const DATE = "date";
  static const COMMENTS = "comments";

  String _id;
  String _payer;
  int _money;
  List _debit;
  Timestamp _date;
  String _comments = '';

  ModelPay.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data()[ID];
    _payer = snapshot.data()[PAYER];
    _money = snapshot.data()[MONEY];
    _date = snapshot.data()[DATE];
    _comments = snapshot.data()[COMMENTS];
    _debit = snapshot.data()[DEBIT];
  }
  ModelPay();

  String get comments => _comments;

  set comments(String value) {
    _comments = value;
  }

  Timestamp get date => _date;

  set date(Timestamp value) {
    _date = value;
  }

  List get debit => _debit;

  set debit(List value) {
    _debit = value;
  }

  int get money => _money;

  set money(int value) {
    _money = value;
  }

  String get payer => _payer;

  set payer(String value) {
    _payer = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}
