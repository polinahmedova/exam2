import 'package:exam2/models/chat_message/chat_message.dart';
import 'package:exam2/routes/pages.dart';
import 'package:exam2/services/socket_service.dart';
import 'package:get/get.dart';

class UserService extends GetxService {
  static UserService get to=>Get.find();
  String username="";
  RxList messages = RxList<ChatMessage>.empty();
  Future<UserService> init() async {
    return this;
  }
void setUsernameAndConnect(String user) {
  username = user;
  SocketService.to.connect();
}
void addMessageToList (ChatMessage message) {printInfo(info: "New message $message");messages.add(message);}

}