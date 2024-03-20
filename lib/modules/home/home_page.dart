import 'package:exam2/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(title: Text('HomePage')),
        body: Padding(
            padding: const EdgeInsets.all(18.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text('Укажите ваше имя'),
              const SizedBox(height: 20),
              TextField(
                controller: controller.textCtrl,
                onSubmitted: (value) => controller.signIn,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), filled: true),
              )
            ])));
  }
}
