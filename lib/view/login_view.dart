import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../firebase_options.dart';

class LoginVIew extends StatefulWidget {
  const LoginVIew({Key? key}) : super(key: key);

  @override
  State<LoginVIew> createState() => _LoginVIewState();
}

class _LoginVIewState extends State<LoginVIew> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Theme(
                data: ThemeData(
                  inputDecorationTheme: InputDecorationTheme(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextField(
                        controller: _email,
                        decoration: InputDecoration(
                          hintText: "Enter your email",
                          labelText: "Email",
                        ),
                        enableSuggestions: false,
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextField(
                        controller: _password,
                        decoration: InputDecoration(
                          hintText: "Enter your password",
                          labelText: "Password",
                        ),
                        obscureText: true,
                        autocorrect: false,
                        enableSuggestions: false,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        try {
                          final email = _email.text;
                          final password = _password.text;
                          final userCredential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: email, password: password);
                          print(userCredential);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == "user-not-found") {
                            print("User not found");
                          } else if (e.code == "wrong-password") {
                            print("Wrong Password");
                          } else {
                            print(e.code);
                          }
                        }
                      },
                      child: Text(
                        "Login",
                        style: GoogleFonts.mcLaren(
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            default:
              return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
