import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoreSettings extends StatelessWidget {
  const MoreSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil().setHeight(17),
        left: ScreenUtil().setWidth(25),
        right: ScreenUtil().setWidth(29),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'More',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(18),
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(33),
          ),
          _profileSettings('About Us', Icons.arrow_forward_ios_outlined),
          SizedBox(
            height: ScreenUtil().setHeight(34),
          ),
          _profileSettings('Privacy policy', Icons.arrow_forward_ios_outlined),
          SizedBox(
            height: ScreenUtil().setHeight(34),
          ),
          _profileSettings(
            'Terms and conditions',
            Icons.arrow_forward_ios,
          ),
        ],
      ),
    );
  }

  Row _profileSettings(String text, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(18),
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(
          icon,
          size: ScreenUtil().setSp(18),
          color: Colors.black,
        ),
      ],
    );
  }
}
