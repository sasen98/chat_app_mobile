import 'dart:async';

import 'package:chat_app/demo/slider_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/screen_padding_widget.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.green,
  ];

  int _currentPage = 0;
  bool end = false;
  final PageController _controller = PageController(
    initialPage: 0,
    viewportFraction: 3,
  );

  _animatePage(int length) {
    Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_currentPage == (length - 1)) {
        end = true;
      } else if (_currentPage == 0) {
        end = false;
      }
      if (end == false) {
        _currentPage++;
      } else {
        _currentPage--;
      }
      _controller.animateToPage(
        _currentPage,
        duration: const Duration(seconds: 5),
        curve: Curves.linear,
      );
    });
  }

  @override
  void initState() {
    _animatePage(colors.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ScreenPadding(
        child: Center(
          child: SizedBox(
            height: 500.h,
            width: 500.w,
            child: PageView.builder(
              pageSnapping: true,
              controller: _controller,
              itemCount: colors.length,
              itemBuilder: (context, index) {
                return SliderItem(color: colors[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
