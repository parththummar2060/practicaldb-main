import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shooping_app/pages/cart_page.dart';
import 'package:shooping_app/pages/home_page.dart';
import 'package:shooping_app/pages/like_page.dart';
import 'package:shooping_app/provider/providerclass.dart';

void main() {
  ThemeController themeControllers = Get.put(ThemeController());

  runApp(GetMaterialApp(
    theme: ThemeData(
      textTheme: const TextTheme(),
      scaffoldBackgroundColor: const Color(0xffF4F8F7),
      secondaryHeaderColor: Colors.white,
      hintColor: Colors.grey.shade300,
      cardColor: Colors.black,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    ),
    darkTheme: ThemeData(
      scaffoldBackgroundColor: Colors.black26,
      cardColor: Colors.black,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    themeMode:
        (themeControllers.isDark.value) ? ThemeMode.dark : ThemeMode.light,
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => const HomePage(),
      "like_page": (context) => const LikePage(),
      "cart_page": (context) => const CartPage(),
    },
  ));
}
