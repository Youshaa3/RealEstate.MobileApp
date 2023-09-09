import 'package:dartz/dartz.dart';
import 'package:real_estate/core/data/models/apis/get_all_profile_model.dart';
import 'package:real_estate/core/data/models/common_response.dart';
import 'package:real_estate/core/data/network/endpoints/all_profile_endpoint.dart';
import 'package:real_estate/core/data/network/network_config.dart';
import 'package:real_estate/core/enums/request_type.dart';
import 'package:real_estate/core/utils/network_util.dart';


class AllProfileRepository {
  Future<Either<String, List<GetAllProfileModel>>> getAll() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: AllProfileEndpoints.getall,
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<List<dynamic>> commonResponse =
        CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          List<GetAllProfileModel> result = [];
          commonResponse.data!.forEach(
                (element) {
              result.add(GetAllProfileModel.fromJson(element));
            },
          );
          return Right(result);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}