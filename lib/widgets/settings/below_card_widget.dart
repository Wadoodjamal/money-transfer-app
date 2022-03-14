import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BelowCardWidget extends StatelessWidget {
  const BelowCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            ScreenUtil().radius(20),
          ),
          bottomRight: Radius.circular(
            ScreenUtil().radius(20),
          ),
        ),
      ),
      height: ScreenUtil().setHeight(190),
      width: double.infinity,
    );
  }
}
