import 'package:dartz/dartz.dart';
import 'package:real_estate/core/data/models/apis/image_model.dart';
import 'package:real_estate/core/data/network/endpoints/image_endpoint.dart';
import 'package:real_estate/core/data/network/network_config.dart';
import 'package:real_estate/core/enums/request_type.dart';
import 'package:real_estate/core/utils/network_util.dart';


import '../models/common_response.dart';


class ImageRepository {
  Future<Either<String, List<ImageModel>>> getAll() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ImageEndpoints.getall,
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<List<dynamic>> commonResponse =
        CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          List<ImageModel> result = [];
          commonResponse.data!.forEach(
                (element) {
              result.add(ImageModel.fromJson(element));
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