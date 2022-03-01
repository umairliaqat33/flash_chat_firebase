import 'package:flutter/material.dart';
import 'package:flash_chat_firebase/screens/welcome_screen.dart';
import 'package:flash_chat_firebase/screens/login_screen.dart';
import 'package:flash_chat_firebase/screens/registration_screen.dart';
import 'package:flash_chat_firebase/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  runApp(FlashChat());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        hintColor: Colors.grey,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes:{
        WelcomeScreen.id:(context)=>WelcomeScreen(),
        LoginScreen.id:(context)=>LoginScreen(),
        RegistrationScreen.id:(context)=>RegistrationScreen(),
        ChatScreen.id:(context)=>ChatScreen(),
      },
    );
  }
}
