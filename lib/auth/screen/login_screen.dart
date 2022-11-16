import 'package:chat_app/auth/bloc/auth_bloc.dart';
import 'package:chat_app/auth/repo/auth_repo.dart';
import 'package:chat_app/routes/routes.dart';
import 'package:chat_app/services/locator_service.dart';
import 'package:chat_app/services/navigation_service.dart';
import 'package:chat_app/widgets/custom_snackbar_widget.dart';
import 'package:chat_app/widgets/custom_textfield_widget.dart';
import 'package:chat_app/widgets/screen_padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _formlKey = GlobalKey<FormState>();

  void _onSubmit(
      {required String email,
      required String password,
      required BuildContext context}) {
    if (_formlKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context)
          .add(AuthLoginEvent(email: email, password: password));
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
                message: 'Logged In Successfully',
                ctx: context);
            locator
                .get<NavigationService>()
                .pushNamedAndRemoveUntil(Routes.homeScreenRoute, false);
          }
          if (state.authStatus == AuthStatus.failed) {
            showSnackBar(
                type: SnackBarType.error,
                message: state.message ?? 'Failed to login',
                ctx: context);
          }
        },
        builder: (context, state) {
          return ScreenPadding(
            child: Form(
              key: _formlKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextFielWidget(
                        hintText: 'Email Id',
                        controller: _emailCtrl,
                        keyboardType: TextInputType.name),
                    SizedBox(height: 10.h),
                    CustomTextFielWidget(
                        controller: _passCtrl,
                        isPassword: true,
                        hintText: 'Password',
                        keyboardType: TextInputType.visiblePassword),
                    SizedBox(height: 10.h),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(Routes.signUpScreenRoute);
                        },
                        child: const Text('SignUp Instead?')),
                    SizedBox(height: 10.h),
                    state.authStatus == AuthStatus.loading
                        ? SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: const CircularProgressIndicator())
                        : ElevatedButton(
                            onPressed: () {
                              _onSubmit(
                                context: context,
                                email: _emailCtrl.text,
                                password: _passCtrl.text,
                              );
                            },
                            child: const Text('Login'),
                          ),
                    InkWell(
                        onTap: () => AuthRepo().googleSignin(),
                        child: const FaIcon(FontAwesomeIcons.google)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
