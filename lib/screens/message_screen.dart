import 'package:flutter/material.dart';
import 'package:flutter_pushnotifications/screens/message_controller.dart';
import 'package:get/get.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*  final args = ModalRoute.of(context)?.settings.arguments ?? "";
    final values = args.toString().split("|"); */
    return GetBuilder<MessageController>(
      init: MessageController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text("Message"),
        ),
        body: Center(
          child: Obx(
            () => Text(
              "Producto: ${_.param}",
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          /* child: Column(
            children: [
              /*  Text(
              "Código: ${values[0]}",
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ), */
              
            ],
          ), */
        ),
      ),
    );
  }
}
