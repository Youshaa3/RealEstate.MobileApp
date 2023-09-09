import 'package:dartz/dartz.dart';
import 'package:real_estate/core/data/models/apis/token_info.dart';
import 'package:real_estate/core/data/models/common_response.dart';
import 'package:real_estate/core/data/network/endpoints/user_endpoint.dart';
import 'package:real_estate/core/data/network/network_config.dart';
import 'package:real_estate/core/enums/request_type.dart';
import 'package:real_estate/core/utils/network_util.dart';


class UserRepository {
  Future<Either<String, TokenInfo>> login({
    required String userName,
    required String password,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: UserEndpoints.login,
        body: {
          'username': userName,
          'password': password,
        },
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse = CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(TokenInfo.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> register({
    required String username,
    required String password,
    required String password2,
    required String email,
    required String phone_number,
  }) async {
    try {
      return NetworkUtil.sendMultipartRequest(
        type: RequestType.POST,
        url: UserEndpoints.register,
        fields: {
          "username": username,
          "password": password,
          "password2": password2,
          "email": email,

          "phone_number": phone_number,
        },
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse = CommonResponse.fromJson(response);

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
