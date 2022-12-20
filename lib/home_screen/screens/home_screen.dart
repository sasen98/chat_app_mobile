import 'package:chat_app/widgets/exit_alert_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExitAlertWidget(
      child: Scaffold(
        body: Center(child: Text('Home Screen')),
      ),
    );
  }
}
