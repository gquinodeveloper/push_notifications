import 'package:flutter/material.dart';
import 'package:flutter_pushnotifications/screens/home_screen.dart';
import 'package:flutter_pushnotifications/screens/message_screen.dart';
import 'package:flutter_pushnotifications/services/push_notification_service.dart';

/*
PASO 1:
  - Configurar el id de la application y ejecutar
PASO 2:
  - Crear proyecto en firebase
  - Instalar android para CMS (CONFIGURACIÓN EN PROYECTO CREADO)
  - Agregar archivo google-service en app

PASO 3:
  - Crear service push
  - Obtener Token de dispositivo
 */
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final messengerKey = GlobalKey<ScaffoldMessengerState>();
  final navigatorKey = GlobalKey<NavigatorState>();
  @override
  void initState() {
    super.initState();
    PushNotificationService.messageStream.listen((message) {
      final snackBar = SnackBar(
        content: Text(message),
        duration: const Duration(
          seconds: 5,
        ),
      );
      messengerKey.currentState?.showSnackBar(snackBar);
      navigatorKey.currentState?.pushNamed("message", arguments: message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      scaffoldMessengerKey: messengerKey,
      navigatorKey: navigatorKey,
      initialRoute: "home",
      routes: {
        'home': (context) => const HomeScreen(),
        'message': (context) => const MessageScreen(),
      },
    );
  }
}
