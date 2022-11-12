import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum SnackBarType { info, warning, success, error }

Color getBackGroundColor(SnackBarType type) {
  switch (type) {
    case SnackBarType.success:
      return Colors.green.withOpacity(0.2);

    case SnackBarType.info:
      return Colors.blue.withOpacity(0.2);

    case SnackBarType.warning:
      return Colors.yellow.withOpacity(0.2);

    case SnackBarType.error:
      return Colors.red.withOpacity(0.2);
  }
}

Color getColor(SnackBarType type) {
  switch (type) {
    case SnackBarType.success:
      return Colors.green;

    case SnackBarType.info:
      return Colors.blue;

    case SnackBarType.warning:
      return Colors.yellow;

    case SnackBarType.error:
      return Colors.red;
  }
}

showSnackBar(
    {required SnackBarType type,
    required String message,
    required BuildContext ctx,
    Duration duration = const Duration(seconds: 3)}) {
  ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
    padding: EdgeInsets.symmetric(horizontal: 10.w),
    content: Row(
      children: [
        Text(
          message,
          style: TextStyle(
            color: getColor(type),
          ),
        )
      ],
    ),
    backgroundColor: getBackGroundColor(type),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.r))),
    duration: duration,
  ));
}
