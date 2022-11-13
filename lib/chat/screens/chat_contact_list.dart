import 'package:chat_app/chat/widgets/chat_tile_widget.dart';
import 'package:chat_app/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';

class ChatContactListScreen extends StatelessWidget {
  const ChatContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarWidget(title: 'Start Chatting'),
      body: ListView.builder(
        itemBuilder: (context, index) => const ChatTileWidget(
          imageUrl: '',
          lastMessage: 'asd',
          name: 'Gola Bhai',
          time: '2 mins',
        ),
        itemCount: 5,
      ),
    );
  }
}
