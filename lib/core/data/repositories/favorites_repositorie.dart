import 'package:dartz/dartz.dart';
import 'package:real_estate/core/data/models/apis/favorites_model.dart';
import 'package:real_estate/core/data/network/endpoints/favorites_endpoint.dart';
import 'package:real_estate/core/data/network/network_config.dart';
import 'package:real_estate/core/enums/request_type.dart';
import 'package:real_estate/core/utils/network_util.dart';


import '../models/common_response.dart';


class FavoritesRepository {
  Future<Either<String, List<FavoritesModel>>> getAll() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: FavoritesEndpoints.getall,
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<List<dynamic>> commonResponse =
        CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          List<FavoritesModel> result = [];
          commonResponse.data!.forEach(
                (element) {
              result.add(FavoritesModel.fromJson(element));
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