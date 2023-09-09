import 'package:real_estate/core/data/network/network_config.dart';

class UserEndpoints
{
  static String register=NetworkConfig.getFullApiUrl('register/');
  static String login=NetworkConfig.getFullApiUrl('login/');
}