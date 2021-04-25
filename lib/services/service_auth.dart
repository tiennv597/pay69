import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pay69/pages/home/scr_home.dart';

class ServiceAuth extends GetxController {
  final auth = FirebaseAuth.instance;
  Future<bool>  signIn(String email, String password) async {
    /* auth.signInWithEmailAndPassword(email: email, password: password).then((_) {
      Get.to(ScrHome());
    });*/

    try {
      await auth
          .signInWithEmailAndPassword(
//              email: email.text.trim(), password: password.text.trim())
              email: email,
              password: password)
          .then((value) async {
        //Get.to(ScrHome());
        return true;
      });
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
