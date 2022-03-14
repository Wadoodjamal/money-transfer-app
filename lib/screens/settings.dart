import 'package:dhukuti/widgets/appbar.dart';
import 'package:dhukuti/widgets/settings/account_settings.dart';
import 'package:dhukuti/widgets/settings/below_card_widget.dart';
import 'package:dhukuti/widgets/settings/more_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          leading: const Icon(
            Icons.settings,
            color: Colors.white,
          ),
          title: Text(
            'Settings',
            style: TextStyle(
                color: Colors.white, fontSize: ScreenUtil().setSp(24)),
          ),
          centerTitle: true,
        ),
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            const BelowCardWidget(),
            Positioned(
              top: ScreenUtil().setHeight(23),
              left: ScreenUtil().setWidth(10),
              right: ScreenUtil().setWidth(10),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: ScreenUtil().setWidth(10),
                      spreadRadius: ScreenUtil().setWidth(10),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(ScreenUtil().setWidth(10)),
                ),
                width: ScreenUtil().setWidth(379),
                height: ScreenUtil().setHeight(690),
                child: const SettingsEntries(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SettingsEntries extends StatelessWidget {
  const SettingsEntries({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(38),
            bottom: ScreenUtil().setHeight(9),
          ),
          child: ListTile(
            title: Text(
              'Wadood Jamal',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(18),
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.pink,
              radius: ScreenUtil().radius(25),
            ),
          ),
        ),
        Divider(
          height: ScreenUtil().setHeight(1),
          color: Colors.grey.shade400,
        ),
        const AccountSettings(),
        Divider(
          height: ScreenUtil().setHeight(28),
          color: Colors.grey.shade400,
        ),
        const MoreSettings(),
      ],
    );
  }
}
