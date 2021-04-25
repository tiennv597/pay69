import 'package:cloud_firestore/cloud_firestore.dart';

class ModelDebit {
  static const PAYER = "payer";
  static const DEBIT = "debit";
  static const EXPENSE = "expense";
  static const PERMONEY = "permoney";

  String _payer;
  Map _debit;
  int _expense;
  int _permoney;

  ModelDebit.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    _payer = snapshot.data()[PAYER];
    _debit = snapshot.data()[DEBIT];
    _expense = snapshot.data()[EXPENSE];
    _permoney = snapshot.data()[PERMONEY];
  }
  ModelDebit();

  Map get debit => _debit;

  set debit(Map value) {
    _debit = value;
  }

  String get payer => _payer;

  set payer(String value) {
    _payer = value;
  }

  int get permoney => _permoney;

  set permoney(int value) {
    _permoney = value;
  }

  int get expense => _expense;

  set expense(int value) {
    _expense = value;
  }
}
