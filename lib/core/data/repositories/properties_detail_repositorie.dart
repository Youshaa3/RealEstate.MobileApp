import 'package:dartz/dartz.dart';
import 'package:real_estate/core/data/models/apis/properties_detail_model.dart';
import 'package:real_estate/core/data/models/common_response.dart';
import 'package:real_estate/core/data/network/endpoints/properties_detail_endpoint.dart';
import 'package:real_estate/core/data/network/network_config.dart';
import 'package:real_estate/core/enums/request_type.dart';
import 'package:real_estate/core/utils/network_util.dart';


class PropertiesDetailRepository {
  Future<Either<String, PropertiesDetailModel>> getAll(int id) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: PropertiesDetailEndpoints.getall+id.toString(),
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<Map<String,dynamic>> commonResponse =
        CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {

          return Right(PropertiesDetailModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}