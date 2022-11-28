import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 50.h),
          SizedBox(
            height: 0.6.sh,
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                    height: 20.h,
                    width: double.maxFinite,
                    color: (index % 2) == 0 ? Colors.green : Colors.orange),
                separatorBuilder: (context, index) => SizedBox(height: 20.h),
                itemCount: 10000000),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.red,
                height: 50.h,
                width: 100.w,
              ),
              Container(
                color: Colors.blue,
                height: 50.h,
                width: 100.w,
              )
            ],
          )
        ],
      ),
    );
  }
}
