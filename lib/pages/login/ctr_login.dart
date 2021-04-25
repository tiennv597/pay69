import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pay69/pages/home/scr_home.dart';
import 'package:pay69/services/service_auth.dart';

class CtrLogin extends GetxController {
  //ServiceAuth serviceAuth = ServiceAuth();
  String email;
  String password;
  final auth = FirebaseAuth.instance;
  Future<bool> signIn() async {
    try {
      await auth
          .signInWithEmailAndPassword(
              email: "tiennv@gmail.com", password: "123456")
          .then((value) async {
        Get.to(ScrHome());
      });
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
