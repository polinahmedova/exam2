import 'package:exam2/models/chat_message/chat_message.dart';
import 'package:exam2/services/user_service.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  RxList<ChatMessage> get messages => UserService.to.messages;
 @override
 void onInit(){
  
 }
}