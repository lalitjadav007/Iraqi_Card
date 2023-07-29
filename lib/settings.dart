import 'package:cards_store/common_widgets.dart';
import 'package:cards_store/controller/settings_controller.dart';
import 'package:cards_store/resources/translation_keys.dart' as translations;
import 'package:cards_store/splash_page.dart';
import 'package:cards_store/ui/my_tickets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_page.dart';

class Settings extends StatelessWidget {
  static var name = "/settings";

  SettingsController controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              translations.appLanguage.tr,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: () {
              Get.updateLocale(const Locale('en', 'EN'));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Get.locale?.languageCode == "en"
                        ? Colors.blueAccent
                        : Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "English",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.updateLocale(const Locale('ar', 'AR'));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Get.locale?.languageCode == "ar"
                        ? Colors.blueAccent
                        : Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "عربي",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: () {
              Get.toNamed(MyTickets.name);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                translations.supportTickets.tr,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: () {
              Get.dialog(AlertDialog(
                actionsOverflowButtonSpacing: 0,
                title: Text(translations.logoutTitle.tr),
                content: Text(translations.logoutMessage.tr),
                actions: [
                  buildSmallButton(context, translations.yesString.tr,
                      () async {
                    await controller.logout();
                    Get.toNamed(LoginPage.name);
                  }),
                  buildSmallButton(context, translations.noString.tr, () {
                    Get.back();
                  })
                ],
              ));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                translations.logoutTitle.tr,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
