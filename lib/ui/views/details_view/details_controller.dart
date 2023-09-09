import 'package:get/get.dart';
import 'package:real_estate/core/data/models/apis/propertie_model.dart';


class DetailController extends GetxController {
  DetailController(PropertiesModel mealModel) {
    model = mealModel;
  }

  PropertiesModel model = PropertiesModel();

  RxInt count = 1.obs;

  // void changeCount(bool increase) {
  //   if (increase)
  //     count++;
  //   else {
  //     if (count > 1) count--;
  //   }
  // }
  //
  // double calcTotal() {
  //   return (count.value * model.price!).toDouble();
  // }

}