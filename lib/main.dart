import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:userinformation/firebase_options.dart';
import 'package:userinformation/view/verify_email_view.dart';
import 'package:userinformation/view/login_view.dart';
import 'package:userinformation/view/register_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/login/": (context) => LoginVIew(),
        "/register/": (context) => RegisterView(),
      },
      home: const HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              if (user.emailVerified) {
                print("Email Verify");
              } else {
                VerifyEmailView();
              }
            } else {
              LoginVIew();
            }
            return Center(child: Text("Done"));
          default:
            return Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }
}
