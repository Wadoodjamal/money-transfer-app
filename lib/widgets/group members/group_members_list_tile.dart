import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupMembersListTile extends StatelessWidget {
  const GroupMembersListTile({
    Key? key,
    this.groupMembers,
  }) : super(key: key);

  final List? groupMembers;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: groupMembers!.length,
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
              title: Container(
                margin: EdgeInsets.only(
                  bottom: ScreenUtil().setHeight(34),
                ),
                child: Text(
                  '${groupMembers![index]}',
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    fontSize: ScreenUtil().setSp(14),
                  ),
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Theme.of(context).primaryColor,
                size: ScreenUtil().setHeight(18),
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
