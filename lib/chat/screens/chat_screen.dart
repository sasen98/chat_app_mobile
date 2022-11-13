import 'package:chat_app/chat/model/chat_message_model.dart';
import 'package:chat_app/chat/widgets/chat_body_widget.dart';
import 'package:chat_app/chat/widgets/chat_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreenArgModel {
  const ChatScreenArgModel({required this.chatId});
  final String chatId;
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key, required this.chatScreenArgModel})
      : super(key: key);
  final ChatScreenArgModel chatScreenArgModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: Column(
            children: [
              Expanded(child: ChatBodyWidget(listOfChat: dummyChatList)),
              const SizedBox(width: double.infinity, child: ChatInputWidget()),
            ],
          ),
        ));
  }
}
