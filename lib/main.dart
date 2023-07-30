import 'package:cards_store/bindings.dart';
import 'package:cards_store/cards_page.dart';
import 'package:cards_store/edit_profile_page.dart';
import 'package:cards_store/home_screen.dart';
import 'package:cards_store/language_settings.dart';
import 'package:cards_store/login_page.dart';
import 'package:cards_store/preferences/shared_preferences.dart';
import 'package:cards_store/profile_page.dart';
import 'package:cards_store/resources/messages.dart';
import 'package:cards_store/resources/translation_keys.dart' as translations;
import 'package:cards_store/settings.dart';
import 'package:cards_store/signup_page.dart';
import 'package:cards_store/splash_page.dart';
import 'package:cards_store/ui/my_tickets.dart';
import 'package:cards_store/ui/new_ticket.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<GetPage<dynamic>>? pages = [
    GetPage(
      name: HomeScreen.name,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: CardsPage.name,
      page: () => CardsPage(),
      binding: CardsBinding(),
    ),
    GetPage(
      name: ProfilePage.name,
      page: () => ProfilePage(),
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
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: SignupPage.name,
      page: () => const SignupPage(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: SplashPage.name,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
        name: MyTickets.name,
        page: () => MyTickets(),
        binding: MyTicketsBinding()),
    GetPage(
        name: NewTicket.name,
        page: () => NewTicket(),
        binding: MyTicketsBinding()),
    GetPage(name: LangaugeSettings.name, page: () => LangaugeSettings()),
  ];

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
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          backgroundColor: Colors.deepPurple,
          textStyle: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w600),
          foregroundColor: Colors.white,
        )),
      ),
      initialBinding: getLoginUser() != null ? HomeBinding() : SplashBinding(),
      initialRoute: getLoginUser() != null ? HomeScreen.name : SplashPage.name,
      getPages: pages,
    );
  }
}
