/// /**
///  * @Author: Ganesh Kumar
///  * @Date:   2022-04-01 09:27:10
///  * @Last Modified by:   Ganesh Kumar
///  * @Last Modified time: 2022-04-17 00:05:53
///  */
import 'dart:convert';

import 'package:chatbot/past_conversation.dart';
import 'package:chatbot/restaurent_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'chat_data.dart';
import 'package:http/http.dart' as http;

List<Restaurant> res = [];
ChatData chatData = ChatData(restaurant: res);
startDataFetch() async {
  var response = await http.get(Uri.parse(
      "https://my-json-server.typicode.com/tryninjastudy/dummyapi/db"));
  var json = jsonDecode(response.body);
  if (json != null) {
    chatData = ChatData.fromJson(json);
    res = chatData.restaurant;
  }
  print(chatData.restaurant[0].bot);
}

class StartNewConversation extends StatelessWidget {
  const StartNewConversation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    startDataFetch();
    return SpeedDial(
      backgroundColor: Colors.black,
      label: const Icon(Icons.message_sharp),
      children: [
        SpeedDialChild(
            visible: true,
            child: const Icon(Icons.hotel),
            label: "Restaurent",
            onTap:
                // () => onTapRestaurent(context)),
                () {
              // SnackBar(content: Text("Abcd"));
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RestaurentChat(
                            res: res,
                          )));
            }),
        SpeedDialChild(
            visible: true,
            child: const Icon(Icons.person),
            label: "Interview",
            onTap: () {}),
      ],
    );
  }
}
