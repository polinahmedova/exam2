import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:exam2/app/modules/home/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 192, 203, 1), // Нежно-розовый фон
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(
            color: Colors.black, // Черный цвет текста
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor:
            Color.fromRGBO(255, 182, 193, 1), // Нежно-розовый фон AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter Your Nickname",
              style: TextStyle(
                fontSize: 24,
                color: Colors.black, // Черный цвет текста
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              cursorColor: Colors.black, // Черный цвет курсора
              controller: controller.textCtrl,
              onSubmitted: (value) => controller.signIn(),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color.fromRGBO(
                    255, 240, 245, 1), // Нежно-розовый фон поля ввода
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                controller.signIn();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Color.fromRGBO(
                    255, 182, 193, 1), // Черный цвет текста на кнопке
              ),
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
