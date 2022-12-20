import 'package:flutter/material.dart';

class ExitAlertWidget extends StatefulWidget {
  const ExitAlertWidget({super.key, required this.child});
  final Widget child;

  @override
  State<ExitAlertWidget> createState() => _ExitAlertWidgetState();
}

class _ExitAlertWidgetState extends State<ExitAlertWidget> {
  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        DateTime now = DateTime.now();
        if (currentBackPressTime == null ||
            now.difference(currentBackPressTime!) >
                const Duration(seconds: 2)) {
          currentBackPressTime = now;

          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Press back again to Exit')));
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: widget.child,
    );
  }
}
