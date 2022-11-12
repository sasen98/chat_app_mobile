import 'package:chat_app/auth/bloc/auth_bloc.dart';
import 'package:chat_app/routes/routes.dart';
import 'package:chat_app/widgets/custom_snackbar_widget.dart';
import 'package:chat_app/widgets/custom_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmPassCtrl = TextEditingController();
  void _onSubmit(
      {required String email,
      required String password,
      required BuildContext ctx}) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(ctx)
          .add(AuthSignUpEvent(email: email, password: password));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.authStatus == AuthStatus.success) {
            showSnackBar(
                type: SnackBarType.success,
                message: 'SignUp Successfully',
                ctx: context);
            Navigator.of(context).pushReplacementNamed(Routes.loginScreenRoute);
          }
          if (state.authStatus == AuthStatus.success) {
            showSnackBar(
                type: SnackBarType.error,
                message: state.message ?? 'Sign up Failed',
                ctx: context);
          }
        },
        builder: (context, state) {
          return Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextFielWidget(
                    hintText: 'Enter your email address',
                    controller: _emailCtrl,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFielWidget(
                    hintText: 'Enter your passwrord',
                    controller: _passCtrl,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFielWidget(
                    hintText: 'Confirm password',
                    controller: _confirmPassCtrl,
                  ),
                  SizedBox(height: 10.h),
                  ElevatedButton(
                      onPressed: () {
                        _onSubmit(
                            email: _emailCtrl.text,
                            password: _passCtrl.text,
                            ctx: context);
                      },
                      child: const Text('Sign Up'))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
