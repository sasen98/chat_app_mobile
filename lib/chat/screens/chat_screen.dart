import 'package:chat_app/chat/model/chat_message_model.dart';
import 'package:chat_app/chat/widgets/chat_body_widget.dart';
import 'package:chat_app/chat/widgets/chat_input_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';

import '../widgets/chat_message_profile_icon.dart';
import 'package:gallery_saver/gallery_saver.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

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
