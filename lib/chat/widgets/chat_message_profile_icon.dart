import 'package:chat_app/chat/model/chat_message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatMessageProfileIcon extends StatelessWidget {
  const ChatMessageProfileIcon(
      {Key? key, required this.chatMessageModel, required this.child})
      : super(key: key);
  final ChatMessageModel chatMessageModel;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (chatMessageModel.senderId == 1) ...[
          const CircleAvatar(
            child: Icon(Icons.face),
          ),
          SizedBox(
            width: 5.h,
          ),
        ],
        if (chatMessageModel.senderId == 2) ...[const Spacer()],
        child,
        if (chatMessageModel.senderId == 1) ...[const Spacer()],
        if (chatMessageModel.senderId == 2) ...[
          SizedBox(
            width: 5.h,
          ),
          const CircleAvatar(
            child: Icon(Icons.face),
          )
        ],
      ],
    );
  }
}
