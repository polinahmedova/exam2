import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:exam2/app/routes/app_pages.dart';
import 'package:exam2/app/services/socket_service.dart';
import 'package:exam2/app/services/user_service.dart';

void main() async {
  await initServices(); // Инициализация всех сервисов перед запуском приложения
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.HOME,
    getPages: AppPages.pages,
  ));
}

Future<void> initServices() async {
  await Get.putAsync(() => SocketService().init());
  await Get.putAsync(() => UserService().init());
}
