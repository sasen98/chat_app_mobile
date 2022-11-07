import 'package:chat_app/widgets/custom_animated_button.dart';
import 'package:chat_app/widgets/custom_textfield_widget.dart';
import 'package:chat_app/widgets/screen_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenPadding(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFielWidget(
                  onChanged: (value) {},
                  hintText: 'Mobile Number',
                  keyboardType: TextInputType.name),
              SizedBox(height: 10.h),
              CustomTextFielWidget(
                  isPassword: true,
                  onChanged: (value) {},
                  hintText: 'Password',
                  keyboardType: TextInputType.visiblePassword),
              SizedBox(
                height: 10.h,
              ),
              const CustomAnimatedButton(buttonTitle: 'Login'),
            ],
          ),
        ),
      ),
    );
  }
}
