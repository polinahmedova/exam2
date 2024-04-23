import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:exam2/app/services/user_service.dart';

class HomeController extends GetxController {
  final textCtrl =
      TextEditingController(); // Контроллер текстового поля для ввода

  void signIn() {
    String username =
        textCtrl.text; // Получаем введенное имя пользователя из текстового поля
    print(username);
    UserService.to.setUsernameAndConnect(
        username); // Устанавливаем имя пользователя и подключаемся к чату через UserService
  }
}
