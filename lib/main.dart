import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:userinformation/screens/chat_screen.dart';
import 'package:userinformation/screens/login_screen.dart';
import 'package:userinformation/screens/registration_screen%20.dart';
import 'package:userinformation/screens/welcome_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(FlatChat());
}

class FlatChat extends StatelessWidget {
  const FlatChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      initialRoute: WelcomeScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        RegistrationScreen.routeName: (context) => RegistrationScreen(),
        ChatScreen.routeName: (context) => ChatScreen(),
      },
      home: WelcomeScreen(),
    );
  }
}
