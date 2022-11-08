import 'package:chat_app/chat/model/chat_message_model.dart';
import 'package:chat_app/chat/widgets/chat_message_profile_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndividualMessageWidget extends StatelessWidget {
  const IndividualMessageWidget({super.key, required this.chatMessageModel});
  final ChatMessageModel chatMessageModel;
  @override
  Widget build(BuildContext context) {
    return ChatMessageProfileIcon(
      chatMessageModel: chatMessageModel,
      child: Column(
        crossAxisAlignment: chatMessageModel.senderId == 1
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          if (chatMessageModel.imageUrl != null) ...[
            Image.network(
              chatMessageModel.imageUrl!,
              height: 100.h,
              width: 100.h,
              fit: BoxFit.cover,
            ),
          ],
          SizedBox(height: 5.h),
          if (chatMessageModel.message != null) ...[
            Container(
                constraints: BoxConstraints(minWidth: 0, maxWidth: 0.6.sw),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: chatMessageModel.senderId == 1
                      ? Colors.grey
                      : Colors.blue,
                ),
                padding: EdgeInsets.all(15.w),
                child: Text(chatMessageModel.message!)),
          ],
        ],
      ),
    );
  }
}
