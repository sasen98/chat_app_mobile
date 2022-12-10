import 'package:chat_app/auth/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({super.key, required this.buttonTitle, this.onTap});

  final String buttonTitle;
  final VoidCallback? onTap;

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  double _width = double.maxFinite;
  Widget? _btnChild;
  late Text _btnTitle;
  final _btnloading = SizedBox(
    height: 25.h,
    width: 25.w,
    child: const CircularProgressIndicator(
      color: Colors.white,
    ),
  );

  double _getWidth(AuthStatus status) {
    if (status == AuthStatus.loading) {
      _width = 60.w;
      return _width;
    } else {
      // Future.delayed(const Duration(seconds: 5), () {
      //   _width = double.maxFinite;
      // });
      _width = double.maxFinite;
      return _width;
    }
  }

  Widget _getChild(AuthStatus status) {
    if (status == AuthStatus.loading) {
      _btnChild = _btnloading;
      return _btnChild!;
    }
    _btnChild = _btnTitle;
    return _btnChild!;
  }

  @override
  void initState() {
    _btnTitle = Text(
      widget.buttonTitle,
      style: const TextStyle(color: Colors.white),
    );
    _btnChild = _btnTitle;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return InkWell(
            onTap: widget.onTap,
            child: AnimatedContainer(
              color: Colors.blue,
              alignment: Alignment.center,
              duration: const Duration(seconds: 2),
              height: 50.h,
              width: _getWidth(state.authStatus),
              child: _getChild(state.authStatus),
            ));
      },
    );
  }
}
