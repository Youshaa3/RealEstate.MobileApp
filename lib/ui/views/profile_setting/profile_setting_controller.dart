import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:real_estate/core/data/models/apis/profile_model.dart';
import 'package:real_estate/core/data/repositories/profile_repositorie.dart';
import 'package:real_estate/core/enums/message_type.dart';
import 'package:real_estate/ui/shared/custom_widgets/custom_toast.dart';
import 'package:real_estate/ui/shared/utils.dart';

class ProfileSettingController extends GetxController {

  Rx<ProfileModel> profileList = ProfileModel().obs;

  Map<String, dynamic> decodedToken = JwtDecoder.decode(storage.getTokenInfo()?.access ?? '');


  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  void getProfile() {
    ProfileRepository().getAll(int.parse('${decodedToken['user_id']}')).then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        profileList.value=r;
      });
    });
  }
}
