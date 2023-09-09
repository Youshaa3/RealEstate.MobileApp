import 'package:get/get.dart';
import 'package:real_estate/core/services/base_controller.dart';
import 'package:real_estate/ui/shared/utils.dart';
import 'package:real_estate/ui/views/intro_view/intro_view.dart';
import 'package:real_estate/ui/views/login_view/login_view.dart';
import 'package:real_estate/ui/views/main_view/main_view.dart';

class SplashScreenController extends BaseController
{

  @override
  void onInit() {

    Future.delayed(Duration(seconds :5)).then((value) {
      if (storage.getFirstLunch()) {

        Get.off(IntroView());

      } else {
        storage.getLogIn() ? Get.off(MainView()) : Get.off(LoginView());
      }
      storage.setFirstLunch(false);
    }
    );
    super.onInit();
  }


}