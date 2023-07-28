import 'package:cards_store/bindings.dart';
import 'package:cards_store/cards_page.dart';
import 'package:cards_store/edit_profile_page.dart';
import 'package:cards_store/home_screen.dart';
import 'package:cards_store/login_page.dart';
import 'package:cards_store/profile_page.dart';
import 'package:cards_store/resources/messages.dart';
import 'package:cards_store/resources/translation_keys.dart' as translations;
import 'package:cards_store/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: translations.title.tr,
      translations: Messages(),
      locale: const Locale('en', 'EN'),
      fallbackLocale: const Locale('en', 'EN'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: LoginBinding(),
      initialRoute: LoginPage.name,
      getPages: [
        GetPage(
          name: HomeScreen.name,
          page: () => const HomeScreen(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: CardsPage.name,
          page: () => const CardsPage(),
          binding: CardsBinding(),
        ),
        GetPage(
          name: ProfilePage.name,
          page: () => const ProfilePage(),
          binding: ProfileBinding(),
        ),
        GetPage(
          name: Settings.name,
          page: () => Settings(),
          binding: SettingsBinding(),
        ),
        GetPage(
          name: EditProfilePage.name,
          page: () => EditProfilePage(),
          binding: EditProfileBinding(),
        ),
        GetPage(
          name: LoginPage.name,
          page: () => LoginPage(),
          binding: LoginBinding(),
        ),
      ],
    );
  }
}
