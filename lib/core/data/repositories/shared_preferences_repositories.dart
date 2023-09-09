import 'dart:convert';
import 'package:get/get.dart';
import 'package:real_estate/core/data/models/apis/token_info.dart';
import 'package:real_estate/core/enums/data_type.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SharedPreferencesRepositories{

  SharedPreferences globalSharedPref = Get.find();

  String PREF_FIRST_LAUNCH = 'first_launch';
  String IS_LOGGED_IN = 'is_logged_in';
  String PREF_TOKEN_INFO = 'token_info';
  String PREF_APP_LANG = 'app_language';


// static String IS_SELECT_PIC = 'is_select_pic';


  setLogIn(bool value){
    setPreference(dataType: DataType.BOOL, key: IS_LOGGED_IN, value: value);
  }

// static setSaveImage(String value){
//   setPreference(dataType: DataType.STRING, key: IS_SELECT_PIC, value: value);
// }

// static String LoadImage(){
//   if (globalSharedPref!.containsKey(IS_SELECT_PIC)) {
//     return getPreference(key: IS_SELECT_PIC);
//   }  else { return 'images/logo.svg'; }
// }


  bool getLogIn(){
    if (globalSharedPref!.containsKey(IS_LOGGED_IN)) {
      return getPreference(key: IS_LOGGED_IN);
    }  else { return false; }
  }

  setFirstLunch(bool value){
    setPreference(dataType: DataType.BOOL , key: PREF_FIRST_LAUNCH , value: value,);
  }

  bool getFirstLunch(){
    if (globalSharedPref.containsKey(PREF_FIRST_LAUNCH)) {
      return getPreference(key: PREF_FIRST_LAUNCH);
    }  else { return true; }
  }



  setTokenInfo(TokenInfo value) {
    setPreference(
      dataType: DataType.STRING,
      key: PREF_TOKEN_INFO,
      value: jsonEncode(value),
    );
  }

  TokenInfo? getTokenInfo() {
    if (globalSharedPref.containsKey(PREF_TOKEN_INFO)) {
      return TokenInfo.fromJson(jsonDecode(getPreference(key: PREF_TOKEN_INFO)));
    } else {
      return null;
    }
  }

  setAppLanguage(String value) {
    setPreference(
      dataType: DataType.STRING,
      key: PREF_APP_LANG,
      value: value,
    );
  }

  String getAppLanguage() {
    if (globalSharedPref.containsKey(PREF_APP_LANG)) {
      return getPreference(key: PREF_APP_LANG);
    } else {
      return 'ar';
    }
  }

  setPreference({required DataType dataType, required String key , required dynamic value}) async {

    switch (dataType){
      case DataType.INT:
        await globalSharedPref.setInt(key, value);
        break;
      case DataType.BOOL:
        await globalSharedPref.setBool(key, value);
        break;
      case DataType.STRING:
        await globalSharedPref.setString(key, value);
        break;
      case DataType.DOUBLE:
        await globalSharedPref.setDouble(key, value);
        break;
      case DataType.LISTSTRING:
        await globalSharedPref.setStringList(key, value);
        break;

    }
  }

  dynamic getPreference({required String key}){
    return globalSharedPref.get(key);
  }

}