import 'dart:convert';

/**
 * @Author: Ganesh Kumar
 * @Date:   2022-04-16 23:24:43
 * @Last Modified by:   Ganesh Kumar
 * @Last Modified time: 2022-04-17 00:24:58
 */

class ChatData {
  ChatData({
    required this.restaurant,
  });

  List<Restaurant> restaurant;

  factory ChatData.fromJson(Map<String, dynamic> json) => ChatData(
        restaurant: List<Restaurant>.from(
            json["restaurant"].map((x) => Restaurant.fromJson(x))),
      );
}

class Restaurant {
  Restaurant({
    required this.bot,
    required this.human,
  });

  String bot;
  String human;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        bot: json["bot"],
        human: json["human"],
      );

  Map<String, dynamic> toJson() => {
        "bot": bot,
        "human": human,
      };

  static Map<String, dynamic> toMap(Restaurant music) =>
      {'bot': music.bot, 'human': music.human};
  static String encode(List<Restaurant> musics) => json.encode(
        musics
            .map<Map<String, dynamic>>((music) => Restaurant.toMap(music))
            .toList(),
      );

  static List<Restaurant> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<Restaurant>((item) => Restaurant.fromJson(item))
          .toList();
}
