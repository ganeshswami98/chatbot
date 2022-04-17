import 'package:chatbot/saved_chat_screen.dart';
import 'package:chatbot/start_new_chat.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// List<Restaurant> list = [];

class PastConversations extends StatefulWidget {
  List<List<String>> savedChat;
  PastConversations({Key? key, required this.savedChat}) : super(key: key);

  @override
  State<PastConversations> createState() => _PastConversationsState();
}

class _PastConversationsState extends State<PastConversations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Recent Chats")),
        floatingActionButton: const StartNewConversation(),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SavedChatScreen(chat: widget.savedChat[index])));
              },
              child: Card(
                child: Container(
                  color: Colors.black45,
                  height: 50,
                  child: Center(child: Text("chat $index")),
                ),
              ),
            );
          },
          itemCount: widget.savedChat.length,
        ));
  }
}









































// import 'package:chatbot/saved_chat_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// // List<Restaurant> list = [];
// List<List<String>> savedChat = [];
// Future<void> getPastChats() async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();

//   final String? chats = await prefs.getString('past_chats');
//   List<String> listChat = [];
//   for (int i = 0; i < chats!.length; i++) {
//     String chat = "";
//     while (chats[i] != "|") {
//       chat += chats[i];
//       i++;
//     }
//     listChat.add(chat);
//   }
//   savedChat.clear();
//   for (int i = 0; i < listChat.length; i++) {
//     List<String> listChat2 = [];
//     for (int j = 0; j < listChat[i].length; j++) {
//       String chat = "";
//       while (listChat[i][j] != ";") {
//         chat += listChat[i][j];
//         j++;
//       }
//       listChat2.add(chat);
//     }
//     savedChat.add(listChat2);
//   }
//   print(savedChat);
// }

// class PastConversations extends StatefulWidget {
//   PastConversations({Key? key}) : super(key: key);

//   @override
//   State<PastConversations> createState() => _PastConversationsState();
// }

// class _PastConversationsState extends State<PastConversations> {
//   @override
//   Widget build(BuildContext context) {
//     getPastChats();
//     // setState(() {});
//     return ListView.builder(
//       itemBuilder: (context, index) {
//         return GestureDetector(
//           onTap: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) =>
//                         SavedChatScreen(chat: savedChat[index])));
//           },
//           child: Card(
//             child: Container(
//               color: Colors.black45,
//               height: 50,
//               child: Center(child: Text("chat $index")),
//             ),
//           ),
//         );
//       },
//       itemCount: savedChat.length,
//     );
//   }
// }
