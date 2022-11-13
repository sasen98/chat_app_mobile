import 'package:chat_app/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbarWidget(title: 'Settings', settingsNeeded: false),
      body: Center(
        child: Text('Settings'),
      ),
    );
  }
}
