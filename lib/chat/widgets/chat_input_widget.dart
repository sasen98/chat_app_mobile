import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatInputWidget extends StatelessWidget {
  const ChatInputWidget({super.key});

  @override
  Widget build(Object context) {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.photo_camera)),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.photo_album_rounded)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.mic)),
        Expanded(
          child: SizedBox(
            height: 40.h,
            child: TextFormField(),
          ),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
      ],
    );
  }
}
