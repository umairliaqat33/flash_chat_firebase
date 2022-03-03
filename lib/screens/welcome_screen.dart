import 'package:flash_chat_firebase/screens/login_screen.dart';
import 'package:flash_chat_firebase/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat_firebase/components/RoundedButton.dart';


class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    animation = ColorTween(
      begin: Colors.blueGrey,
      end: Colors.white,
    ).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
      // print(animation.value);
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: animation.value,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      height: 60,
                    ),
                  ),
                  AnimatedTextKit(
                    isRepeatingAnimation: true,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Flash Chat',
                      speed: Duration(milliseconds: 100),
                        textStyle: TextStyle(fontSize: 45),
                      ),
                    ],
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 48.0,
              ),
              RoundedButton(Colors.lightBlueAccent, "Login", (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              }),
              RoundedButton(
                  Colors.blueAccent, 'Registration', (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationScreen()));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
