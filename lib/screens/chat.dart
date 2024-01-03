import 'dart:developer';

import 'package:chat_app/widgets/chat_messages.dart';
import 'package:chat_app/widgets/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void setUpPushNotifications() async {
    final fcm = FirebaseMessaging.instance;
    await fcm.requestPermission();
    final token = await fcm.getToken();
    log(token!);
  }

  @override
  void initState() {
    super.initState();
    setUpPushNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CHAT APP',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Alert!!'),
                      content: const Text('Do you want to logout?'),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              FirebaseAuth.instance.signOut();
                              Navigator.of(context).pop();
                            },
                            child: const Text('Yes')),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('No'))
                      ],
                    );
                  });
            },
            icon: const Icon(Icons.exit_to_app),
            color: Theme.of(context).colorScheme.primary,
          )
        ],
      ),
      body: const Column(
        children: [
          Expanded(
            child: ChatMessages(),
          ),
          NewMessage(),
        ],
      ),
    );
  }
}
//e0GrJDvlR024ZFkpqawwxW:APA91bGangLS9Hj63bB9fT7of13qXwMnuGsEb77UOnCZYivAvql9kJPr8hxlQud39eTGHzo42-rpJW9UyNFcADkhZLAHlmTHODMERymWbbdpsCszcNzjDnULAxPjssxGtpO1sSBdg5It