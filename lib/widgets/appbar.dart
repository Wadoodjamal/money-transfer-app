import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 135, 240, 255),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                ScreenUtil().radius(50),
              ),
              bottomRight: Radius.circular(
                ScreenUtil().radius(50),
              ),
            ),
          ),
          height: ScreenUtil().setHeight(70),
          width: double.infinity,
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                ScreenUtil().radius(50),
              ),
              bottomRight: Radius.circular(
                ScreenUtil().radius(50),
              ),
            ),
          ),
          height: ScreenUtil().setHeight(60),
          width: double.infinity,
        ),
      ],
    );
  }
}
