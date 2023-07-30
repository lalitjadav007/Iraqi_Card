import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:cards_store/resources/translation_keys.dart' as translations;

class LangaugeSettings extends GetWidget {
  static var name = "/settings/language";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translations.appLanguage.tr),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.updateLocale(const Locale('en', 'EN'));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Get.locale?.languageCode == "en"
                    ? Colors.blueAccent
                    : Colors.white,
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
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Get.locale?.languageCode == "en"
                              ? Colors.white
                              : Colors.blueAccent),
                    ),
                  ),
                  Icon(Icons.check, color: Get.locale?.languageCode == "en"
                      ? Colors.white
                      : Colors.blueAccent),
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
                color: Get.locale?.languageCode == "ar"
                    ? Colors.blueAccent
                    : Colors.white,
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
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Get.locale?.languageCode == "ar"
                              ? Colors.white
                              : Colors.blueAccent),
                    ),
                  ),
                  Icon(Icons.check, color: Get.locale?.languageCode == "en"
                      ? Colors.white
                      : Colors.blueAccent),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
