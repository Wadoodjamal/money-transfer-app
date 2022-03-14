import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Test extends StatelessWidget {
  const Test({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil().setHeight(31),
        bottom: ScreenUtil().setHeight(44),
        left: ScreenUtil().setWidth(21),
        right: ScreenUtil().setWidth(17),
      ),
      child: Text(
        'My Group Members',
        style: TextStyle(
          fontFamily: Theme.of(context).textTheme.button!.fontFamily,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          fontSize: ScreenUtil().setSp(22),
        ),
      ),
    );
  }
}
