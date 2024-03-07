import 'package:flutter/material.dart';

class ChatUserCard extends StatefulWidget {
  const ChatUserCard({super.key});

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        child: InkWell(
          onTap: () {},
          child: ListTile(
            leading: CircleAvatar(child: Icon(Icons.person_2_rounded)),
            title: Text('User1'),
            subtitle: Text('Last user message', maxLines: 1),
            trailing: Text('11:00 PM'),
          ),
        ));
  }
}
