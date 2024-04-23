import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:exam2/app/data/socket_events.dart';
import 'package:exam2/app/modules/chat/widget/bubble_message.dart';
import 'chat_controller.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 200, 220, 1),
      appBar: AppBar(
        title: const Text(
          'Chat',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromRGBO(255, 150, 180, 1),
        actions: [
          IconButton(
            onPressed: () {
              controller.disconnect();
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                controller: controller.scrollCtrl,
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  var message = controller.messages[index];
                  var itsMe = controller.itsMe(message.clientId);
                  switch (message.type) {
                    case SocketEvent.login:
                      return Center(
                        child: Text(
                          "${message.username} entered the chat!",
                          style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    case SocketEvent.logout:
                      return Center(
                        child: Text(
                          "${message.username} left the chat!",
                          style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    case SocketEvent.newMessage:
                      return BubbleMessage(message: message, itsMe: itsMe);
                    default:
                      return const SizedBox();
                  }
                },
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.textCtrl,
                    decoration: const InputDecoration(
                      hintText: 'Enter your message...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => controller.sendMessage(),
                  icon: const Icon(
                    Icons.send,
                    color: Color.fromRGBO(255, 150, 180, 1),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
