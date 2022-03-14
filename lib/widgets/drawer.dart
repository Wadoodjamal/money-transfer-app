import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  List drawerMenuItemsTitle = [
    'My Groups',
    'Transactions',
    'Join a group',
    'Create a group',
    'Settings'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().setWidth(266),
      child: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(
              ScreenUtil().radius(25),
            ),
            bottomRight: Radius.circular(
              ScreenUtil().radius(25),
            ),
          ),
        ),
        child: Column(
          children: [
            const UserProfile(),
            DrawerMenuItems(
              drawerMenuItemsTitle: drawerMenuItemsTitle,
            ),
            SizedBox(
              height: ScreenUtil().setHeight(127),
            ),
            OutlinedButton(
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                  BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        ScreenUtil().radius(25),
                      ),
                    ),
                  ),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: ScreenUtil().setHeight(24),
                      bottom: ScreenUtil().setHeight(24),
                      left: ScreenUtil().setWidth(33),
                      right: ScreenUtil().setWidth(52),
                    ),
                    child: Text(
                      'Sign Out',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(23),
                        fontFamily:
                            Theme.of(context).textTheme.button!.fontFamily,
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Icon(
                    FontAwesomeIcons.signOutAlt,
                    color: Theme.of(context).primaryColor,
                    size: ScreenUtil().setHeight(20),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// User Profile Widget which contains the user pic and his/her name
class UserProfile extends StatelessWidget {
  const UserProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(15),
        top: ScreenUtil().setHeight(49),
        bottom: ScreenUtil().setHeight(50),
      ),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/EditProfile'),
        child: ListTile(
          horizontalTitleGap: -12,
          leading: CircleAvatar(
            foregroundImage: const AssetImage('assets/member_iamge.png'),
            radius: ScreenUtil().radius(25),
          ),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              UserProfileName(
                text: 'Vighnesh Nikam',
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              UserProfileName(
                text: '@Vighnesh Nikam',
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Widget for the text and text style of the user profile name
class UserProfileName extends StatelessWidget {
  const UserProfileName({
    Key? key,
    this.text,
    this.fontWeight,
    this.fontSize,
  }) : super(key: key);

  final String? text;
  final FontWeight? fontWeight;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        fontFamily: Theme.of(context).textTheme.button!.fontFamily,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight,
        fontSize: ScreenUtil().setSp(fontSize!),
      ),
    );
  }
}

// Drawer menu items for the drawer built using ListTie
// From these menu items user can navigate to other application screens
class DrawerMenuItems extends StatefulWidget {
  const DrawerMenuItems({
    Key? key,
    required this.drawerMenuItemsTitle,
  }) : super(key: key);

  final List drawerMenuItemsTitle;

  @override
  State<DrawerMenuItems> createState() => _DrawerMenuItemsState();
}

class _DrawerMenuItemsState extends State<DrawerMenuItems> {
  final List _iconsList = [
    FontAwesomeIcons.users,
    FontAwesomeIcons.moneyBill,
    FontAwesomeIcons.plus,
    FontAwesomeIcons.ellipsisV,
    FontAwesomeIcons.cog
  ];

  void _navigateToScreen(BuildContext context, int index) {
    Navigator.of(context).pop();

    if (index == 0) {
      Navigator.pushNamed(context, '/MyGroups');
    } else if (index == 1) {
      Navigator.pushNamed(context, '/Transfer');
    } else if (index == 2) {
      Navigator.pushNamed(context, '/JoinAGroup');
    } else if (index == 3) {
      Navigator.pushNamed(context, '/CreateAGroup');
    } else {
      Navigator.pushNamed(context, '/Settings');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.drawerMenuItemsTitle.length,
      itemBuilder: (context, index) => Container(
        margin: EdgeInsets.only(
          bottom: ScreenUtil().setHeight(14),
        ),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 242, 244, 248),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(
              ScreenUtil().radius(15),
            ),
            bottomRight: Radius.circular(
              ScreenUtil().radius(15),
            ),
          ),
        ),
        child: GestureDetector(
          onTap: () => _navigateToScreen(context, index),
          child: ListTile(
            horizontalTitleGap: 4,
            leading: Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(8),
              ),
              child: Icon(
                _iconsList[index],
                size: ScreenUtil().setHeight(21),
                color: Theme.of(context).primaryColor,
              ),
            ),
            title: Text(
              '${widget.drawerMenuItemsTitle[index]}',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: ScreenUtil().setHeight(20),
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
