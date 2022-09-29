import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task/views/findPartner.dart';
import 'package:task/views/login.dart';
import 'package:task/views/message.dart';
import 'package:task/views/suggestions.dart';
import 'package:task/views/temp.dart';
import 'package:task/views/temp2.dart';
import 'package:task/views/temp3.dart';
import 'package:task/views/test.dart';
import 'package:task/views/userMessage.dart';
import 'package:task/views/username.dart';
import 'package:task/views/ask.dart';
import 'package:task/views/signup.dart';
import 'package:task/views/home.dart';
// const Color(0xFFED6F1A),
// const Color(0xFF2D2D2E),
// const Color(0xFFF2F1F0),

void main() {
  runApp(MaterialApp(

    theme: ThemeData(
      //brightness: Brightness.dark,
      //primarySwatch: Color(0xFFED6F1A),

      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary:  Color(0xFFED6F1A),
        onPrimary: Color(0xFFF2F1F0),
        secondary: Color(0xFF2D2D2E),
        onSecondary: Color(0xFF2D2D2E),
        error: Colors.red,
        onError: Colors.red,
        background: Colors.transparent,
        onBackground: Colors.transparent,
        surface: Colors.transparent,
        onSurface: Colors.transparent,
      ),

      textTheme: const TextTheme(
        headline1: TextStyle(
        fontSize: 27,
        fontWeight: FontWeight.bold,
        color: Color(0xFFF2F1F0),
      ),
        headline2: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Color(0xFF2D2D2E),
        ),
        headline4: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          //color: Color(0xFF2D2D2E),
        ),
      ),

      // For styling ElevationButtons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFFED6F1A),
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          minimumSize: const Size.fromHeight(50),
        ),
      ),

      // For borders of all TextFields , and font of input
      inputDecorationTheme: InputDecorationTheme(
        hintStyle:  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18,),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1.5,),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder:OutlineInputBorder(
          borderSide: const BorderSide(width: 1.5,),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1.5,),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(width: 1.5),
        ),

      ),

    ),

    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const Welcome(),
      '/ask': (context) => const Ask(),
      '/signup': (context) => const Signup(),
      '/login': (context) => const Login(),
      '/home': (context) => const Home(),
      '/find': (context) => const FindPartner(),
      '/temp': (context) => const Temp(),
      '/temp2': (context) => const Temp2(),
      '/temp3': (context) => const Temp3(),
      '/suggestions': (context) => const Suggestions(),
      '/sug': (context) => const HomeSuggestion(),
      '/message': (context) => const Message(),
      '/username': (context) => const Username(),
      '/usermsg': (context) => const UserMessage(),
    },
  ));

}

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  @override
  initState() {
    super.initState();
    Timer(const Duration(seconds: 2), onClose);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background_welcome.png'),
                  fit: BoxFit.fill,
                ),
              ),
                padding: const EdgeInsets.all(8),alignment: Alignment.center,
            ),
            const Center(child: Text('Welcome', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)),
          ],
        )
    );
  }

  void onClose() {
    Navigator.of(context).pushReplacement(PageRouteBuilder(
        maintainState: true,
        opaque: true,
        pageBuilder: (context, _, __) => const Ask(),
        transitionDuration: const Duration(seconds: 2),
        transitionsBuilder: (context, anim1, anim2, child) {
          return FadeTransition(
            opacity: anim1,
            child: child,
          );
        }));
  }

}

