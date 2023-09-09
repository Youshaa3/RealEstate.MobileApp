import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/core/data/repositories/user_repositorie.dart';
import 'package:real_estate/core/enums/message_type.dart';
import 'package:real_estate/core/services/base_controller.dart';
import 'package:real_estate/ui/shared/custom_widgets/custom_toast.dart';
import 'package:real_estate/ui/shared/utils.dart';
import 'package:real_estate/ui/views/main_view/main_view.dart';

class LoginController extends BaseController {
  TextEditingController nameController = TextEditingController(text: 'anas');
  TextEditingController passwordController = TextEditingController(text: 'anas2000IT');

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void login() {
    // if (formKey.currentState!.validate()) {
      runFullLoadingFutureFunction(
          function: UserRepository().login(
              password: passwordController.text,
              userName: nameController.text,)
              .then((value) {
            value.fold((l) {
              CustomToast.showMessage(
                  message: l, messageType: MessageType.REJECTED);
            }, (r) {
              storage.setLogIn(true);
              storage.setTokenInfo(r);
              Get.off( ()=> MainView());
            });
          }));
    // }
  }
}