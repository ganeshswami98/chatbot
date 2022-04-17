import 'package:flutter/material.dart';

class ChatRow extends StatelessWidget {
  const ChatRow({
    Key? key,
    required this.text,
    required this.isCurrentUser,
  }) : super(key: key);
  final String text;
  final String isCurrentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // asymmetric padding
      padding: EdgeInsets.fromLTRB(
        isCurrentUser == "bot" ? 64.0 : 16.0,
        4,
        isCurrentUser == "bot" ? 16.0 : 64.0,
        4,
      ),
      child: Align(
        // align the child within the container
        alignment: isCurrentUser == "bot"
            ? Alignment.centerRight
            : Alignment.centerLeft,
        child: DecoratedBox(
          // chat bubble decoration
          decoration: BoxDecoration(
            color: isCurrentUser == "bot" ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color:
                      isCurrentUser == "bot" ? Colors.white : Colors.black87),
            ),
          ),
        ),
      ),
    );
  }
}
