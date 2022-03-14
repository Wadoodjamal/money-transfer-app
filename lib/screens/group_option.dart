import 'package:dhukuti/widgets/group%20option/group_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupOption extends StatefulWidget {
  const GroupOption({Key? key}) : super(key: key);

  @override
  _GroupOptionState createState() => _GroupOptionState();
}

class _GroupOptionState extends State<GroupOption> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(400.r),
            ),
            child: Container(
              child: Image(
                alignment: Alignment.centerLeft,
                image: const AssetImage(
                  'assets/icon.png',
                ),
                height: 228.h,
                width: 228.w,
              ),
              width: 290.w,
              height: 360.h,
              color: const Color.fromARGB(255, 0, 194, 203),
            ),
          ),
          Center(
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GroupButtons(
                    marginLeft: 28,
                    marginRight: 32,
                    marginBottom: 20,
                    paddingBottom: 19,
                    paddingLeft: 55,
                    paddingRight: 62,
                    paddingTop: 19,
                    buttonText: 'Join a group',
                    backgroundColor: const Color.fromARGB(255, 0, 194, 203),
                    borderColor: const Color.fromARGB(255, 0, 194, 203),
                    textColor: Colors.white,
                    callBack: () => Navigator.pushNamed(context, '/AllGroups'),
                  ),
                  GroupButtons(
                    marginLeft: 28,
                    marginRight: 32,
                    marginBottom: 76,
                    paddingBottom: 19,
                    paddingLeft: 42,
                    paddingRight: 42,
                    paddingTop: 19,
                    buttonText: 'Create a group',
                    backgroundColor: Colors.white,
                    borderColor: const Color.fromARGB(255, 0, 194, 203),
                    textColor: const Color.fromARGB(255, 0, 194, 203),
                    callBack: () =>
                        Navigator.pushNamed(context, '/CreateAGroup'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
