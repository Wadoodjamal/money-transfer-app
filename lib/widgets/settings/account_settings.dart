import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({
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
            'Account Settings',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(18),
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          _profileSettings('Edit Profile', Icons.arrow_forward_ios_outlined),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          _profileSettings('Change Password', Icons.arrow_forward_ios_outlined),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          _notificatitonDarkMode('Push Notifications', true),
          SizedBox(
            height: ScreenUtil().setHeight(45),
          ),
        ],
      ),
    );
  }

  Row _notificatitonDarkMode(String text, bool value) {
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
        Switch.adaptive(
          value: value,
          onChanged: (value) {},
          activeColor: Colors.pink,
          inactiveThumbColor: Colors.grey,
        ),
      ],
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
