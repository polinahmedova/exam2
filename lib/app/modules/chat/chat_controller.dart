import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:exam2/app/data/models/chat_message/chat_message.dart';
import 'package:exam2/app/services/socket_service.dart';
import 'package:exam2/app/services/user_service.dart';

class ChatController extends GetxController {
  RxList<ChatMessage> get messages =>
      UserService.to.messages; // Список сообщений из UserService

  final textCtrl =
      TextEditingController(); // Контроллер текстового поля ввода сообщения
  final scrollCtrl = ScrollController();

  @override
  void onInit() {
    messages.listen((p0) async {
      // Прослушивание изменений в сообщениях
      if (scrollCtrl.hasClients) {
        var max = scrollCtrl.position.maxScrollExtent;
        if (scrollCtrl.offset + 100 >= max) {
          // Если прокрутка близка к концу, делаем прокрутку вниз
          await Future.delayed(
              const Duration(
                milliseconds: 100,
              ), () {
            if (scrollCtrl.hasClients) {
              scrollCtrl.jumpTo(scrollCtrl.position.maxScrollExtent);
            }
          });
        }
      }
    });
    super.onInit();
  }

  void disconnect() {
    //messages.clear();
    SocketService.to.disconnect();
  }

  // Проверка, является ли сообщение пользователя
  bool itsMe(String clientId) => clientId == SocketService.to.clientId;

  sendMessage() {
    var message = textCtrl.text;
    if (message.isNotEmpty) SocketService.to.sendMessageToChat(message);
    textCtrl.clear();
  }

  @override
  void onClose() {
    scrollCtrl.dispose(); // Освобождение ресурсов контроллера
    super.onClose();
  }
}
