import 'package:get/get.dart';

import '../preferences/shared_preferences.dart';

class SettingsController extends GetxController {
  Future<void> logout() async {
    await getPrefs?.clear();
  }
}
