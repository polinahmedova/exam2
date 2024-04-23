import 'package:get/get.dart';
import 'package:exam2/app/data/models/chat_message/chat_message.dart';
import 'package:exam2/app/services/socket_service.dart';

class UserService extends GetxService {
  static UserService get to =>
      Get.find(); //создание ссылки на самом себя чтобы сервисы могли общаться

  String username = '';
  final messages = RxList<ChatMessage>.empty(); // Список сообщений пользователя

  Future<UserService> init() async {
    return this;
  }

  void setUsernameAndConnect(String user) {
    username = user; // Установка имени пользователя
    SocketService.to
        .connect(); // Вызов метода подключения к серверу из SocketService
  }

  void addMessageToList(ChatMessage message) {
    printInfo(
        info: 'New message $message'); // Вывод информации о новом сообщении
    messages.add(message); //Добавить сообщение в список
  }

  void clearMessage() => messages.clear(); // Очистка списка сообщений
}
