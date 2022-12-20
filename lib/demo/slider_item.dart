import 'package:flutter/material.dart';

class SliderItem extends StatelessWidget {
  const SliderItem({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: color,
      ),
    );
  }
}
