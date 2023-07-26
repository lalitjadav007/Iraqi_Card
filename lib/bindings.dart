import 'package:cards_store/controller/settings_controller.dart';
import 'package:cards_store/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(),
    );
  }
}

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
          () => SettingsController(),
    );
  }
}
