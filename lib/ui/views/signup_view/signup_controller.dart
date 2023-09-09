import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/core/data/repositories/user_repositorie.dart';
import 'package:real_estate/core/enums/message_type.dart';
import 'package:real_estate/core/services/base_controller.dart';
import 'package:real_estate/ui/shared/custom_widgets/custom_toast.dart';
import 'package:real_estate/ui/shared/utils.dart';
import 'package:real_estate/ui/views/main_view/main_view.dart';

class SignupController extends BaseController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  RxBool hidePassword1 = true.obs;
  RxBool hidePassword2 = true.obs;

  void signup() {
    runFullLoadingFutureFunction(
        function: UserRepository().register(
          username: nameController.text,
          password: passwordController1.text,
          password2: passwordController2.text,
          email: emailController.text,
          phone_number: phoneController.text,
        )
            .then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            CustomToast.showMessage(
                message: 'Registered Successfully',
                messageType: MessageType.SUCCESS);
            UserRepository().login(
              password: passwordController1.text,
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
            });
          });
        })
    );
  }
}