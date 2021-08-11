import 'package:flutter/material.dart';
import '../models/message.dart';
import 'message_page.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MessagePage(message: messages[index]);
                  },
                ),
              );
            },
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).accentColor,
            ),
            title: Text(
              messages[index].author,
              style: const TextStyle(fontSize: 18),
            ),
            subtitle: Text(
              messages[index].content,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(messages[index].sentTime),
          );
        },
      ),
    );
  }
}
