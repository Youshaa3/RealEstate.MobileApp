import 'package:dartz/dartz.dart';
import 'package:real_estate/core/data/models/common_response.dart';
import 'package:real_estate/core/data/network/endpoints/add_new_house_endpoint.dart';
import 'package:real_estate/core/data/network/network_config.dart';
import 'package:real_estate/core/enums/request_type.dart';
import 'package:real_estate/core/utils/network_util.dart';

class AddNewHouseRepository {

  Future<Either<String, bool>> addNew({
    required int user_id,
    required String name,
    required double price,
    required bool sell,
    required String description,
    required String city,
    required String region,
    required int number_of_rooms,
    required String photoPath,
  }) async {
    try {
      return NetworkUtil.sendMultipartRequest(
        type: RequestType.POST,
        url: AddNewHouseEndpoint.addNew,
        fields: {
          'user': user_id.toString(),
          'name': name,
          'price': price.toString(),
          'sell': sell.toString(),
          'description': description,
          'city': city,
          'region': region,
          'number_of_rooms': number_of_rooms.toString(),
        },
        files: {"uploaded_images": photoPath},
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
        CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(commonResponse.getStatus);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
