import 'package:avatar_glow/avatar_glow.dart';
import 'package:chatbot/start_new_chat.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'chat_data.dart';
import 'chat_row.dart';
import 'dart:convert';
import 'package:speech_to_text/speech_to_text.dart' as stt;

// List<Restaurant>? resList;
saveChat(List<String> list, BuildContext context) async {
  String abc = "";
  for (var i in list) {
    abc = abc + i;
    abc = abc + ";";
  }
  abc += "Chat Ended;";
  abc += "|";

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  String? chats = await prefs.getString('past_chats');
  // chats = chats! + abc;
  print(chats);
  bool status = chats != null
      ? await prefs.setString('past_chats', chats + abc)
      : await prefs.setString('past_chats', abc);
  print(status);
  Navigator.pop(context);
}

class RestaurentChat extends StatefulWidget {
  List<Restaurant> res;
  RestaurentChat({Key? key, required this.res}) : super(key: key);
  // ChatData? chatData;
  @override
  State<RestaurentChat> createState() => _RestaurentChatState();
}

class _RestaurentChatState extends State<RestaurentChat> {
  late stt.SpeechToText _speech;
  int _isListening = 2;
  String _text = "";
  int _itemCount = 1;
  List<String> _list = [];
  int ind = 0;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    if (_isListening == 2) _list.add(res[ind].bot);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _listen,
        child: Icon(_speech.isListening ? Icons.stop_rounded : Icons.mic_none),
      ),
      appBar: AppBar(
        leading: Container(height: 0),
        title: const Text("Restaurent"),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 20, 10, 20),
            child: GestureDetector(
              onTap: () {
                saveChat(_list, context);
              },
              child: const Text(
                "End Chat",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ChatRow(
              text: _list[index],
              isCurrentUser: index % 2 != 0 ? "bot" : "user");
        },
        itemCount: _list.length,
      ),
    );
  }

  void _listen() async {
    if (_isListening != 1) {
      // await _speech.initialize();
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        // setState(() => _isListening = 1);
        _isListening = 1;
        _speech.listen(
          onResult: (val) => {_text = val.recognizedWords},
        );
      }
    } else {
      setState(() => {
            _isListening = 0,
            _list.add(_text),
            if ((_text.toLowerCase()).replaceAll(RegExp('[^A-Za-z0-9]'), '') ==
                (res[ind].human.toLowerCase())
                    .replaceAll(RegExp('[^A-Za-z0-9]'), '')) ...[
              ind++,
              if (ind == res.length) ...[
                _list.add("Chat Ended")
              ] else ...[
                _list.add(res[ind].bot)
              ]
            ] else ...[
              _list.add("Try Again")
            ],
            _speech.stop()
          });
      // _list.add(widget.res[ind].bot);

    }
  }
}
