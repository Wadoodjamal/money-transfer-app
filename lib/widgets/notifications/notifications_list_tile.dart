import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsListTile extends StatelessWidget {
  const NotificationsListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Container(
                margin: EdgeInsets.only(
                  bottom: ScreenUtil().setHeight(11),
                ),
                child: CircleAvatar(
                  radius: ScreenUtil().radius(22),
                  foregroundImage: const AssetImage('assets/member_iamge.png'),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'MEMBER ${index + 1} NAME',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal,
                      fontSize: ScreenUtil().setSp(14),
                    ),
                  ),
                  Text(
                    'MEMBER ${index + 1} just sent you Rs 2300',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal,
                      fontSize: ScreenUtil().setSp(16),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(15)),
                ],
              ),
              trailing: GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/GroupMembers'),
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Theme.of(context).primaryColor,
                  size: ScreenUtil().setHeight(18),
                ),
              ),
            ),
            Divider(
              height: ScreenUtil().setHeight(3),
              color: const Color.fromARGB(255, 222, 225, 239),
            )
          ],
        );
      },
    );
  }
}
