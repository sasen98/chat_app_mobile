import 'package:chat_app/chat/screens/chat_screen.dart';
import 'package:chat_app/routes/routes.dart';
import 'package:chat_app/services/locator_service.dart';
import 'package:chat_app/services/navigation_service.dart';
import 'package:chat_app/widgets/cache_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatTileWidget extends StatelessWidget {
  const ChatTileWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.lastMessage,
    required this.time,
  });
  final String imageUrl;
  final String name;
  final String lastMessage;
  final String time;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => locator<NavigationService>().navigateTo(
          Routes.chatScreenRoute,
          arguments: const ChatScreenArgModel(chatId: '6')),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20.r,
              child: CacheImageWidget(
                  isImageCircle: true, radius: 20.r, imageUrl: imageUrl),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                  ),
                  Text(lastMessage),
                ],
              ),
            ),
            const Spacer(),
            Text(time),
          ],
        ),
      ),
    );
  }
}
