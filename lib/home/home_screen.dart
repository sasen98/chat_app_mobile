import 'package:chat_app/routes/routes.dart';
import 'package:chat_app/services/locator_service.dart';
import 'package:chat_app/services/navigation_service.dart';
import 'package:chat_app/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarWidget(
        title: 'Home Screen',
        
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Welcome to the app'),
            ElevatedButton(
                onPressed: () {
                  locator<NavigationService>()
                      .navigateTo(Routes.chatListScreenRoute);
                },
                child: const Text('Start Chat'))
          ],
        ),
      ),
    );
  }
}
