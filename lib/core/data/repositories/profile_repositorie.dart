import 'package:dartz/dartz.dart';
import 'package:real_estate/core/data/models/apis/profile_model.dart';
import 'package:real_estate/core/data/models/common_response.dart';
import 'package:real_estate/core/data/network/endpoints/profile_endpoint.dart';
import 'package:real_estate/core/data/network/network_config.dart';
import 'package:real_estate/core/enums/request_type.dart';
import 'package:real_estate/core/utils/network_util.dart';


class ProfileRepository {
  Future<Either<String, ProfileModel>> getAll(int id) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ProfileEndpoints.getall+id.toString(),
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<Map<String,dynamic>> commonResponse =
        CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          
          return Right(ProfileModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}