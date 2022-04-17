import 'package:chatbot/past_conversation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

List<List<String>> savedChat = [];
Future<void> getPastChats() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  // ignore: await_only_futures
  String? chats = await prefs.getString('past_chats');
  List<String> listChat = [];
  for (int i = 0; i < chats!.length; i++) {
    String chat = "";
    while (chats[i] != "|") {
      chat += chats[i];
      i++;
    }
    listChat.add(chat);
  }
  savedChat.clear();
  for (int i = 0; i < listChat.length; i++) {
    List<String> listChat2 = [];
    for (int j = 0; j < listChat[i].length; j++) {
      String chat = "";
      while (listChat[i][j] != ";") {
        chat += listChat[i][j];
        j++;
      }
      listChat2.add(chat);
    }
    savedChat.add(listChat2);
  }
  print(savedChat);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    getPastChats();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat Bot',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PastConversations(
          savedChat: savedChat,
        )
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
