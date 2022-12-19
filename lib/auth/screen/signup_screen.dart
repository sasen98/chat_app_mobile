import 'package:chat_app/auth/auth_bloc/auth_bloc.dart';
import 'package:chat_app/auth/model/user_model.dart';
import 'package:chat_app/constants/auth_constants.dart';
import 'package:chat_app/custom_extension/validation_extension.dart';
import 'package:chat_app/routes/routes.dart';
import 'package:chat_app/services/locator_service.dart';
import 'package:chat_app/services/navigation_service.dart';
import 'package:chat_app/services/input_validator_service.dart';
import 'package:chat_app/widgets/animated_button.dart';
import 'package:chat_app/widgets/custom_snackbar_widget.dart';
import 'package:chat_app/widgets/custom_textfield_widget.dart';
import 'package:chat_app/widgets/screen_padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailCtrl = TextEditingController();

  final TextEditingController _passCtrl = TextEditingController();

  final TextEditingController _confirmPassCtrl = TextEditingController();

  final TextEditingController _nameCtrl = TextEditingController();

  void _onSubmit(
      {required String email,
      required String password,
      required BuildContext ctx}) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(ctx)
          .add(AuthSignUpEvent(email: email, password: password));
      locator<NavigationService>()
          .pushReplacementNamed(Routes.loginScreenRoute);
    }
  }

  DateTime? currentBackPressTime;
  @override
  Widget build(BuildContext context) {
    UserModel userModel = UserModel();

    return Scaffold(
      body: WillPopScope(
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
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) async {
            if (state.authStatus == AuthStatus.success) {
              BlocProvider.of<AuthBloc>(context)
                  .add(StoreInDataBaseEvent(userModel: userModel));
              if (state.dataBaseStatus == DataBaseStatus.success) {
                showSnackBar(
                    type: SnackBarType.error,
                    message: state.message ?? 'Signed up Successfully',
                    ctx: context);
                storeValue(
                    key: SharedPrefsKey.authKey, value: state.user.token!);
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
                        validator: (val) => InputValidatorService.validateName(
                            name: _nameCtrl.text),
                        hintText: 'Enter your Name',
                        controller: _nameCtrl,
                      ),
                      SizedBox(height: 10.h),
                      CustomTextFielWidget(
                        hintText: 'Enter your email address',
                        controller: _emailCtrl,
                        validator: (val) => InputValidatorService.validateEmail(
                            email: _emailCtrl.text),
                      ),
                      SizedBox(height: 10.h),
                      CustomTextFielWidget(
                        isPassword: true,
                        hintText: 'Enter your passwrord',
                        validator: (val) =>
                            InputValidatorService.validatePassword(
                                password: _passCtrl.text),
                        controller: _passCtrl,
                      ),
                      SizedBox(height: 10.h),
                      CustomTextFielWidget(
                        validator: (val) =>
                            InputValidatorService.validateConfirmPassword(
                                confirmPassword: _confirmPassCtrl.text,
                                password: _passCtrl.text),
                        isPassword: true,
                        hintText: 'Confirm password',
                        controller: _confirmPassCtrl,
                      ),
                      SizedBox(height: 10.h),
                      TextButton(
                          onPressed: () => locator<NavigationService>()
                              .pushReplacementNamed(Routes.loginScreenRoute),
                          child: const Text('Already have an Account?')),
                      SizedBox(height: 10.h),
                      AnimatedButton(
                        buttonTitle: 'Sign Up',
                        onTap: () {
                          userModel = UserModel(
                            email: _emailCtrl.text,
                            name: _nameCtrl.text,
                          );
                          _onSubmit(
                              email: _emailCtrl.text,
                              password: _passCtrl.text,
                              ctx: context);
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
