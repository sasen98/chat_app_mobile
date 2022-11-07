// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAnimatedButton extends StatefulWidget {
  final String buttonTitle;
  const CustomAnimatedButton({
    Key? key,
    required this.buttonTitle,
  }) : super(key: key);

  @override
  State<CustomAnimatedButton> createState() => _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomAnimatedButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      //onTap: ,
      child: Container(
        //duration: Duration(seconds: 5),
        //curve: Curves.bounceIn,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          // color: _color,
        ),
        //height: _height,
        //width: _width,
        child: Text(
          widget.buttonTitle,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
