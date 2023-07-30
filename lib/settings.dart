import 'package:cards_store/common_widgets.dart';
import 'package:cards_store/controller/settings_controller.dart';
import 'package:cards_store/preferences/shared_preferences.dart';
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
          Container(
            decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Theme.of(context).dividerColor),
                  bottom: BorderSide(color: Theme.of(context).dividerColor),
                )
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                Icon(Icons.language),
                SizedBox(width: 10,),
                Text(
                  translations.appLanguage.tr,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(MyTickets.name);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Theme.of(context).dividerColor),
                )
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  Icon(Icons.tab_sharp),
                  SizedBox(width: 10,),
                  Text(
                    translations.supportTickets.tr,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ),
          getLoginUser() != null ?
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
                    Get.offAndToNamed(LoginPage.name);
                  }),
                  buildSmallButton(context, translations.noString.tr, () {
                    Get.back();
                  })
                ],
              ));
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Theme.of(context).dividerColor),
                  )
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  Icon(Icons.logout),
                  SizedBox(width: 10,),
                  Text(
                    translations.logoutTitle.tr,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ) :
          GestureDetector(
            onTap: () {
              Get.offAllNamed(LoginPage.name);
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Theme.of(context).dividerColor),
                  )
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  Icon(Icons.login),
                  SizedBox(width: 10,),
                  Text(
                    translations.buttonLogin.tr,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
