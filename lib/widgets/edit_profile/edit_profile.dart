import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileFields extends StatelessWidget {
  const EditProfileFields({
    Key? key,
    this.text,
    this.labelText,
  }) : super(key: key);

  final String? text;
  final String? labelText;

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
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            hintText: labelText!,
            labelStyle: const TextStyle(color: Colors.white),
            hintStyle: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
