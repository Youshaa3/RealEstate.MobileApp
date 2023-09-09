import 'package:get/get.dart';
import 'package:real_estate/core/data/models/apis/favorites_model.dart';
import 'package:real_estate/core/data/repositories/favorites_repositorie.dart';
import 'package:real_estate/core/enums/message_type.dart';
import 'package:real_estate/ui/shared/custom_widgets/custom_toast.dart';

class FavoritesController extends GetxController {

  RxList<FavoritesModel> favoritesList = <FavoritesModel>[].obs;

  @override
  void onInit() {
    getFavorites();
    super.onInit();
  }

  void getFavorites() {
    FavoritesRepository().getAll().then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        favoritesList.addAll(r);
      });
    });
  }
}
