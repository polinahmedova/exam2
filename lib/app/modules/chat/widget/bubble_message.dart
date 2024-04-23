import 'package:flutter/material.dart';
import 'package:exam2/app/data/models/chat_message/chat_message.dart';

class BubbleMessage extends StatelessWidget {
  const BubbleMessage({Key? key, required this.message, required this.itsMe})
      : super(key: key);

  final ChatMessage message; // Сообщение для отображения
  final bool
      itsMe; // Флаг, определяющий, является ли сообщение текущим пользователя

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: itsMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: itsMe
              ? Color.fromRGBO(255, 182, 193, 1)
              : Color.fromRGBO(212, 108, 120, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!itsMe)
              Text(
                message.username,
                style: TextStyle(
                  color: itsMe ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            Text(
              message.message,
              style: TextStyle(
                color: itsMe ? Colors.black87 : Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
