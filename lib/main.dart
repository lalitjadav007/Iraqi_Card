import 'package:cards_store/bindings.dart';
import 'package:cards_store/controller/my_tickets_controller.dart';
import 'package:cards_store/home.dart';
import 'package:cards_store/resources/messages.dart';
import 'package:cards_store/ui/my_tickets.dart';
import 'package:cards_store/ui/new_ticket.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cards_store/resources/translation_keys.dart' as translations;

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
      locale: const Locale('ar', 'AR'),
      fallbackLocale: const Locale('en', 'EN'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: HomeBinding(),
      initialRoute: HomeScreen.name,
      getPages: [
        GetPage(name: HomeScreen.name, page: () => HomeScreen(), binding: HomeBinding()),
        GetPage(name: MyTickets.name, page: () => MyTickets(), binding: MyTicketsBinding()),
        GetPage(name: NewTicket.name, page: () => NewTicket(), binding: MyTicketsBinding()),
      ],
    );
  }
}
