import 'package:cloud_firestore/cloud_firestore.dart';

class ModelDebit {
  static const PAYER = "payer";
  static const DEBIT = "debit";
  String _payer;
  Map _debit;

  ModelDebit.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    _payer = snapshot.data()[PAYER];
    _debit = snapshot.data()[DEBIT];
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
}
