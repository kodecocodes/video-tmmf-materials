import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:rw_material_transitions/widgets/motion_route.dart';
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
                MaterialMotionRoutes.sharedAxis(
                  MessagePage(message: messages[index]),
                  SharedAxisTransitionType.horizontal,
                ),
              );
            },
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).accentColor,
            ),
            title: Hero(
              tag: 'msg-${messages[index].id}',
              child: Material(
                color: Colors.transparent,
                child: Text(
                  messages[index].author,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
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
