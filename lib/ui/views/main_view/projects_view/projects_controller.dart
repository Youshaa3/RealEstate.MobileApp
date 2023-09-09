import 'package:get/get.dart';
import 'package:real_estate/core/data/models/apis/propertie_model.dart';
import 'package:real_estate/core/data/repositories/properties_repositores.dart';
import 'package:real_estate/core/enums/message_type.dart';
import 'package:real_estate/core/enums/operation_type.dart';
import 'package:real_estate/core/enums/request_status.dart';
import 'package:real_estate/core/services/base_controller.dart';
import 'package:real_estate/ui/shared/custom_widgets/custom_toast.dart';

class ProjectsController extends BaseController {

  RxList<PropertiesModel> projectList = <PropertiesModel>[].obs;

  bool get isProjectsLoading =>
      requestStatus.value == RequestStatus.LOADING &&
          listType.contains(OperationType.PROJECTS);

  @override
  void onInit() {
    getAllProjects();
    super.onInit();
  }

  void getAllProjects() {
    runLoadingFutureFunction(
        type: OperationType.PROJECTS,
        function: PropertiesRepository().getAll().then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            projectList.addAll(r);
          });
        }));
  }

}