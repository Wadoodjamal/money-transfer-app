import 'package:dhukuti/widgets/appbar.dart';
import 'package:dhukuti/widgets/bottom_navigation_bar.dart';
import 'package:dhukuti/widgets/notifications/notifications_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const CustomBottomNavigationBar(),
        appBar: AppBar(
          title: const Text('Notifications'),
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
              Container(
                margin: EdgeInsets.only(
                  top: ScreenUtil().setHeight(31),
                  bottom: ScreenUtil().setHeight(44),
                  left: ScreenUtil().setWidth(21),
                  right: ScreenUtil().setWidth(17),
                ),
                child: Text(
                  'You can check your notifications here',
                  style: TextStyle(
                    fontFamily: Theme.of(context).textTheme.button!.fontFamily,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(22),
                  ),
                ),
              ),
              const NotificationsListTile()
            ],
          ),
        ),
      ),
    );
  }
}
