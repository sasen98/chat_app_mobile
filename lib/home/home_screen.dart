import 'package:chat_app/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbarWidget(
        title: 'Home Screen',
      ),
      body: Center(
        child: Text('Welcome to the app'),
      ),
    );
  }
}
