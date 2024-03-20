//1.Создать мейн функцию getmain
import 'package:exam2/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  await initServices();
  runApp(
    GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.HOME,
        getPages: AppPages.pages,
    )
  );
}
Future<void> initServices() async {}

