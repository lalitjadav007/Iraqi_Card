import 'package:cards_store/bindings.dart';
import 'package:cards_store/home.dart';
import 'package:cards_store/home_controller.dart';
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
      title: 'Cards',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: HomeBinding(),
      initialRoute: HomeScreen.name,
      getPages: [
        GetPage(name: HomeScreen.name, page: () => HomeScreen(), binding: HomeBinding())
      ],
    );
  }
}
