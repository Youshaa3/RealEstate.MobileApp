import 'package:get/get.dart';
import 'package:real_estate/core/data/models/apis/propertie_model.dart';
import 'package:real_estate/core/data/repositories/properties_repositores.dart';
import 'package:real_estate/core/enums/message_type.dart';
import 'package:real_estate/ui/shared/custom_widgets/custom_toast.dart';

class HomeViewController extends GetxController {

  RxList<PropertiesModel> propertyList = <PropertiesModel>[].obs;

  @override
  void onInit() {
    getAllProperty();
    super.onInit();
  }

  void getAllProperty() {
    PropertiesRepository().getAll().then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        propertyList.addAll(r);
      });
    });
  }
}