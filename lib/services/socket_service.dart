import 'package:exam2/models/chat_message/chat_message.dart';
import 'package:exam2/models/socket_event.dart';
import 'package:exam2/routes/pages.dart';
import 'package:exam2/services/user_service.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketService extends GetxService {
  static SocketService get to => Get.find();
  late Socket _socket;
  Future<SocketService> init() async {
    _socket = io(
        'https://masqed.ru',
        OptionBuilder()
            .setTransports(['websocket'])
            .setPath('/chat/socket.io')
            .disableAutoConnect()
            .disableReconnection()
            .build());
    _socket.onConnect((data) { printInfo(info: "Socket Connected"); Get.offNamed(Routes.CHAT);});
    _socket.onDisconnect((data) => printInfo(info: "Disconnected"));
    _socket.onConnectError((data) => printInfo(info: "Connection Error"));
    _socket.on(SocketEvent.newMessage.name, (data) {
      data['type'] =SocketEvent.newMessage.name;
      var message = ChatMessage.fromJson(data);
      UserService.to.addMessageToList(message);
    });
    _socket.on(SocketEvent.login.name(data) {
      data['type'] = SocketEvent.login.name;
      var message = ChatMessage.fromJson(data); 
      UserService.to})
    return this;
  }

  void connect() {
    
    _socket.connect();
  }

  void disconnect() {
    _socket.disconnect();
  }
}
