import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpFields extends StatelessWidget {
  const SignUpFields({
    Key? key,
    this.text,
    this.func,
  }) : super(key: key);

  final String? text;
  final Function(String)? func;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text!,
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
            letterSpacing: 1.h,
            color: Colors.white,
          ),
        ),
        TextFormField(
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          onChanged: (value) {
            func!(value);
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
