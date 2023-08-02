import 'package:cards_store/cards_page.dart';
import 'package:cards_store/common_widgets.dart';
import 'package:cards_store/controller/home_controller.dart';
import 'package:cards_store/home_page.dart';
import 'package:cards_store/profile_page.dart';
import 'package:cards_store/resources/translation_keys.dart' as translations;
import 'package:cards_store/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetWidget<HomeController> {
  static var name = "/home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Image.asset(
              "assets/images/app_logo.png",
              scale: 1.0,
              height: 80,
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
              )
            ],
          ),
          body: Obx(() {
            return IndexedStack(
              index: controller.selectedTab.value,
              children: [
                HomePage(),
                CardsPage(),
                ProfilePage(),
                Settings(),
              ],
            );
          }),
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              showSelectedLabels: true,
              selectedItemColor: Colors.black,
              currentIndex: controller.selectedTab.value,
              onTap: (value) {
                controller.selectedTab.value = value;
              },
              showUnselectedLabels: false,
              items: [
                buildNavigationBarItem(Icons.home, translations.home.tr),
                buildNavigationBarItem(
                    Icons.credit_card, translations.cards.tr),
                buildNavigationBarItem(Icons.person, translations.profile.tr),
                buildNavigationBarItem(
                    Icons.settings, translations.settings.tr),
              ],
            ),
          ),
        );
      },
    );
  }
}
