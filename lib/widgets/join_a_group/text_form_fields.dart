import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFields extends StatelessWidget {
  const TextFormFields({
    Key? key,
    this.text,
    this.height,
    this.isIcon,
    this.labelText,
    this.icon,
  }) : super(key: key);

  final String? text;
  final double? height;
  final bool? isIcon;
  final String? labelText;
  final Icon? icon;

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
            fontWeight: FontWeight.normal,
            fontSize: 14.sp,
            letterSpacing: 1.h,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: height?.h,
        ),
        TextFormField(
          cursorColor: Colors.white,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: icon,
            hintStyle: const TextStyle(color: Colors.white),
            hintText: labelText!.isNotEmpty ? labelText : null,
            focusColor: Colors.white,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
