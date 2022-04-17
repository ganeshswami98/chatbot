import 'package:chatbot/chat_row.dart';
import 'package:flutter/material.dart';

class SavedChatScreen extends StatelessWidget {
  List<String> chat;
  SavedChatScreen({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurent"),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return ChatRow(
              text: chat[index],
              isCurrentUser: index % 2 != 0 ? "bot" : "user");
        }),
        itemCount: chat.length,
      ),
    );
  }
}
