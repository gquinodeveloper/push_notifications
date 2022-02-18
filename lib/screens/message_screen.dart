import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments ?? "";
    final values = args.toString().split("|");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Message"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Código: ${values[0]}",
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Producto: ${values[1]}",
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
