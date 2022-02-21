/*
SHA1: 90:AC:1F:6F:68:5A:03:C3:86:5D:4B:51:A5:5A:F8:8A:31:60:D5:F2
*/
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String token = "";

/*   static StreamController<String> _messageStream = StreamController.broadcast();
  static Stream<String> get messageStream => _messageStream.stream; */
  static RxString _message = RxString("");
  static RxString get message => _message;

  //Inicial
  static Future initializeApp() async {
    //Inicializar firebase
    await Firebase.initializeApp();
    //Recuperar Token
    token = await messaging.getToken() ?? "No found token";
    print("Token device: " + token);
    //Llamar a servicio para guardar token en BD

    //Crear 3 eventos
    FirebaseMessaging.onBackgroundMessage(_onBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);
  }

  //funciones para Eventos
  static Future _onBackgroundHandler(RemoteMessage message) async {
    //_messageStream.add(message.data["product"]);
    _message.value = message.data["product"];
    //print("_onBackgroundHandler: ${message.data["product"]}");
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    //_messageStream.add(message.data["product"]);
    _message.value = message.data["product"];
    //print("_onMessageHandler: ${message.data["product"]}");
  }

  static Future _onMessageOpenedApp(RemoteMessage message) async {
    //_messageStream.add(message.data["product"]);
    _message.value = message.data["product"];
    //print("_onMessageOpenedApp: ${message.data["product"]}");
  }

  static close() {
    //_messageStream.close();
  }
}
