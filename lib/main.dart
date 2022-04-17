import 'package:chatbot/past_conversation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat Bot',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PastConversations()
        // RestaurentChat()
        //  SpeechToText()
        //     Scaffold(
        //   appBar: AppBar(
        //     title: Text("Recent Chats"),
        //   ),
        //   floatingActionButton: const StartNewConversation(),
        //   body: PastConversations(),
        // ),
        );
  }
}
