import 'package:real_estate/core/enums/request_type.dart';
import 'package:real_estate/ui/shared/utils.dart';


class NetworkConfig {
  static String BASE_API = '/';

  static String getFullApiUrl(String api) {
    return BASE_API + api;
  }

  static Map<String, String> getHeaders(
      {bool? needAuth = true,
        RequestType? type = RequestType.POST,
        Map<String, String>? extraHeaders}) {
    return {
      'Accept-Language':storage.getAppLanguage(),
      if (needAuth!)
        'Authorization':
        'Bearer ${storage.getTokenInfo()?.access ?? ''}',
      if (type != RequestType.GET) 'Content-Type': 'application/json',
      ...extraHeaders ?? {}
    };
  }
}


// class NetworkConfig {
//   static String BASE_API = 'api/web/';
//
//   static String getFullApiUrl(String api) {
//     return BASE_API + api;
//   }
//
//   static Map<String, String> getHeaders(
//       {bool? needAuth = true,
//         RequestType? type = RequestType.POST,
//         Map<String, String>? extraHeaders}) {
//     return {
//       if (needAuth!)
//         'Authorization':
//         'Bearer ${SharedPrefranceRepository.getTokenInfo()?.accessToken ?? ''}',
//       // if (type != RequestType.GET) 'Content-Type': 'application/json',
//       ...extraHeaders ?? {}
//     };
//   }
// }