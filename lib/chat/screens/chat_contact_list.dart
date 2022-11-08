import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChatContactList extends StatelessWidget {
  const ChatContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(), 
      body: ListView.builder(
        itemBuilder: (context, index) => Container(),
        itemCount: 5,
      ),
    );
  }
}
