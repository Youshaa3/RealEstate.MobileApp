import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:real_estate/core/data/repositories/shared_preferences_repositories.dart';

bool isEmail(String value){
  String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(p);

  return regExp.hasMatch(value);
}

bool isPassword(String value){
  String p = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

  RegExp regExp = RegExp(p);

  return regExp.hasMatch(value);
}

double screenWidth(double percent) {
  return Get.size.width / percent ;
}

double screenHeight(double percent) {
  return Get.size.height / percent ;
}

SharedPreferencesRepositories get storage =>
    Get.find<SharedPreferencesRepositories>();

void customLoader() => BotToast.showCustomLoading(toastBuilder: (builder) {
  return Container(
    width: screenWidth(5),
    height: screenWidth(5),
    decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(15)),
    child: SpinKitCircle(color: Colors.teal),
  );
});