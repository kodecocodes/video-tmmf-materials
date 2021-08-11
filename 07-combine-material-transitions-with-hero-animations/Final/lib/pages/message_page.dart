import 'package:flutter/material.dart';
import '../models/message.dart';

class MessagePage extends StatelessWidget {
  final Message message;
  const MessagePage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                MessageBox(message: message),
              ],
            ),
          ),
          const MessageForm()
        ],
      ),
    );
  }
}

class MessageBox extends StatelessWidget {
  const MessageBox({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'msg-${message.id}',
              child: Material(
                color: Colors.transparent,
                child: Text(
                  message.author,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(message.content),
            const SizedBox(height: 16),
            Row(
              children: [
                const Spacer(),
                Text(
                  message.sentTime,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MessageForm extends StatelessWidget {
  const MessageForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.grey[300],
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  hintText: 'Enter Message',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(64),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.send),
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
