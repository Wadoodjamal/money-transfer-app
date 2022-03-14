import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AmountTo extends StatelessWidget {
  const AmountTo({
    Key? key,
    this.text,
    this.textColor,
  }) : super(key: key);

  final String? text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        color: textColor,
        fontFamily: Theme.of(context).textTheme.button!.fontFamily,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        fontSize: ScreenUtil().setSp(18),
      ),
    );
  }
}
