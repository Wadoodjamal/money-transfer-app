import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupButtons extends StatelessWidget {
  const GroupButtons({
    Key? key,
    this.paddingTop,
    this.paddingBottom,
    this.paddingLeft,
    this.paddingRight,
    this.marginLeft,
    this.marginRight,
    this.marginBottom,
    this.buttonText,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.callBack,
  }) : super(key: key);

  final double? paddingTop;
  final double? paddingBottom;
  final double? paddingLeft;
  final double? paddingRight;
  final double? marginLeft;
  final double? marginRight;
  final double? marginBottom;
  final String? buttonText;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final VoidCallback? callBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: ScreenUtil().setWidth(marginLeft!),
        right: ScreenUtil().setWidth(marginRight!),
        bottom: ScreenUtil().setHeight(marginBottom!),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: BorderSide(
                color: borderColor!,
              ),
              borderRadius: BorderRadius.circular(
                ScreenUtil().radius(45),
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          elevation: MaterialStateProperty.all(1.0),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: paddingTop!.h,
            bottom: paddingBottom!.h,
            right: paddingRight!.w,
            left: paddingLeft!.w,
          ),
          child: Text(
            buttonText!,
            style: TextStyle(
              color: textColor,
              fontSize: 26.sp,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
              fontFamily: Theme.of(context).textTheme.button!.fontFamily,
            ),
          ),
        ),
        onPressed: callBack,
      ),
    );
  }
}
