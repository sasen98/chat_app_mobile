import 'package:chat_app/chat/model/chat_message_model.dart';
import 'package:chat_app/chat/widgets/individual_message_widget.dart';
import 'package:chat_app/widgets/screen_padding_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBodyWidget extends StatelessWidget {
  const ChatBodyWidget({super.key, required this.listOfChat});
  final List<ChatMessageModel> listOfChat;

  @override
  Widget build(BuildContext context) {
    return ScreenPadding(
      padding: EdgeInsets.symmetric(horizontal: 5.h),
      child: ListView.separated(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),

          // reverse: true,
          itemBuilder: (context, index) =>
              IndividualMessageWidget(chatMessageModel: listOfChat[index]),
          separatorBuilder: (context, index) => SizedBox(height: 10.h),
          itemCount: dummyChatList.length),
    );
  }
}
