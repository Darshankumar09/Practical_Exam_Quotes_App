import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:practical_exam/views/screens/displayed_page.dart';
import 'package:practical_exam/views/screens/home_page.dart';
import 'package:practical_exam/views/screens/quotes_page.dart';

void main() async {
  await GetStorage.init();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      getPages: [
        GetPage(
          name: "/",
          page: () => const HomePage(),
        ),
        GetPage(
          name: "/quote_page",
          page: () => const QuotePage(),
        ),
        GetPage(
          name: "/displayed_quote_page",
          page: () => const DisplayedPage(),
        ),
      ],
    ),
  );
}
