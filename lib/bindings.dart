import 'package:cards_store/controller/cards_controller.dart';
import 'package:cards_store/controller/login_controller.dart';
import 'package:cards_store/controller/settings_controller.dart';
import 'package:cards_store/home_controller.dart';
import 'package:get/get.dart';

import 'controller/edit_profile_controller.dart';
import 'controller/profile_controller.dart';

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

class CardsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CardsController(),
    );
  }
}

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProfileController(),
    );
  }
}

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => EditProfileController(),
    );
  }
}

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(),
    );
  }
}
