import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInFields extends StatefulWidget {
  const SignInFields({
    Key? key,
    this.text,
    this.marginInBetween,
    this.func,
  }) : super(key: key);

  final String? text;
  final double? marginInBetween;
  final Function(String)? func;

  @override
  State<SignInFields> createState() => _SignInFieldsState();
}

class _SignInFieldsState extends State<SignInFields> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.text!,
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: ScreenUtil().setSp(14),
            letterSpacing: ScreenUtil().setHeight(1),
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(widget.marginInBetween!),
        ),
        TextFormField(
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          onChanged: (value) {
            widget.func!(value);
          },
          decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              label: null,
              labelStyle: TextStyle(color: Colors.white),
              hintStyle: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
