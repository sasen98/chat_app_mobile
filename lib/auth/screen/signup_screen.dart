import 'package:chat_app/auth/auth_bloc/auth_bloc.dart';
import 'package:chat_app/auth/model/user_model.dart';
import 'package:chat_app/constants/auth_constants.dart';
import 'package:chat_app/routes/routes.dart';
import 'package:chat_app/services/locator_service.dart';
import 'package:chat_app/services/navigation_service.dart';
import 'package:chat_app/widgets/custom_snackbar_widget.dart';
import 'package:chat_app/widgets/custom_textfield_widget.dart';
import 'package:chat_app/widgets/screen_padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmPassCtrl = TextEditingController();
  final _nameCtrl = TextEditingController();

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
    UserModel userModel = UserModel();

    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (state.authStatus == AuthStatus.success) {
            BlocProvider.of<AuthBloc>(context)
                .add(StoreInDataBaseEvent(userModel: userModel));
            if (state.dataBaseStatus == DataBaseStatus.success) {
              showSnackBar(
                  type: SnackBarType.error,
                  message: state.message ?? 'Signed up Successfully',
                  ctx: context);
              storeValue(key: SharedPrefsKey.authKey, value: state.user.token!);
              locator<NavigationService>()
                  .pushReplacementNamed(Routes.homeScreenRoute);
            } else {
              showSnackBar(
                  type: SnackBarType.error,
                  message: state.message ?? 'Sign up Failed',
                  ctx: context);
            }
          }
          if (state.authStatus == AuthStatus.failed) {
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
              child: ScreenPadding(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextFielWidget(
                      hintText: 'Enter your Name',
                      controller: _nameCtrl,
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFielWidget(
                      hintText: 'Enter your email address',
                      controller: _emailCtrl,
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFielWidget(
                      isPassword: true,
                      hintText: 'Enter your passwrord',
                      controller: _passCtrl,
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFielWidget(
                      isPassword: true,
                      hintText: 'Confirm password',
                      controller: _confirmPassCtrl,
                    ),
                    SizedBox(height: 10.h),
                    ElevatedButton(
                        onPressed: () {
                          userModel = UserModel(
                            email: _emailCtrl.text,
                            name: _nameCtrl.text,
                          );
                          _onSubmit(
                              email: _emailCtrl.text,
                              password: _passCtrl.text,
                              ctx: context);
                        },
                        child: const Text('Sign Up'))
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
