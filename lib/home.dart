import 'package:cards_store/cards_page.dart';
import 'package:cards_store/home_controller.dart';
import 'package:cards_store/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetWidget<HomeController> {
  static var name = "/home";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Gift Cards"),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications),
              )
            ],
          ),
          body: Container(child: Obx(() {
            return IndexedStack(
              index: controller.selectedTab.value,
              children: [
                CardsPage(),
                Settings(),
                Settings(),
                Settings(),
              ],
            );
          })),
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
                BottomNavigationBarItem(
                  icon: Icon(Icons.credit_card, color: Colors.black),
                  label: "Cards",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.group, color: Colors.black),
                  label: "Cards",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.credit_card, color: Colors.black),
                  label: "Cards",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings, color: Colors.black),
                  label: "Settings",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
