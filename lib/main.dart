import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/my_app.dart';
import 'core/data/repositories/shared_preferences_repositories.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync(() async {
    var sharedPref = await SharedPreferences.getInstance();
    return sharedPref;
  },
  );

  Get.put(SharedPreferencesRepositories());
  runApp(const MyApp());
}
