import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuAppBar extends StatefulWidget {
  const MenuAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<MenuAppBar> createState() => _MenuAppBarState();
}

class _MenuAppBarState extends State<MenuAppBar> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Container(
        width: double.infinity,
        margin: EdgeInsets.all(
          ScreenUtil().setHeight(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              visualDensity: const VisualDensity(
                horizontal: -4,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                size: ScreenUtil().setHeight(24),
                color: Colors.white,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: ScreenUtil().setWidth(42),
                  height: ScreenUtil().setHeight(42),
                  child: const Image(
                    image: AssetImage('assets/notification.png'),
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(9),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/EditProfile'),
                  child: Container(
                    margin: EdgeInsets.only(
                      top: ScreenUtil().setHeight(5),
                    ),
                    child: CircleAvatar(
                      foregroundImage:
                          const AssetImage('assets/member_iamge.png'),
                      radius: ScreenUtil().radius(18),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
