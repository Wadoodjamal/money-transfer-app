import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'menu_app_bar.dart';

class AppBarWelcome extends StatefulWidget {
  const AppBarWelcome({
    Key? key,
  }) : super(key: key);

  @override
  State<AppBarWelcome> createState() => _AppBarWelcomeState();
}

class _AppBarWelcomeState extends State<AppBarWelcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(75),
          bottomRight: Radius.circular(75),
        ),
        color: Theme.of(context).primaryColor,
      ),
      height: ScreenUtil().setHeight(247),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const MenuAppBar(),
          Container(
            margin: EdgeInsets.only(
              left: ScreenUtil().setWidth(44),
              right: ScreenUtil().setWidth(148),
            ),
            child: Text(
              'Good Morning Vighnesh,',
              style: TextStyle(
                fontFamily: Theme.of(context).textTheme.button!.fontFamily,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
                fontSize: ScreenUtil().setSp(24),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
