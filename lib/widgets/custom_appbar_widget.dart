import 'package:chat_app/routes/routes.dart';
import 'package:chat_app/services/locator_service.dart';
import 'package:chat_app/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppbarWidget extends StatelessWidget with PreferredSizeWidget {
  const CustomAppbarWidget({
    super.key,
    required this.title,
    this.subtitle,
    this.actions,
    this.centerTitle = false,
    this.isChat = false,
  });
  final String title;
  final String? subtitle;
  final List<Widget>? actions;
  final bool centerTitle;
  final bool isChat;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      actions: [
        IconButton(
            onPressed: () => locator.get<NavigationService>().navigateTo(
                  Routes.settingsScreenRoute,
                ),
            icon: const Icon(Icons.settings)),
        if (actions != null) ...actions!,
      ],
      title: subtitle != null
          ? Column(
              children: [
                Text(title),
                Text(subtitle!),
              ],
            )
          : Text(title),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
