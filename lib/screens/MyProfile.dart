import 'package:dhukuti/widgets/edit_profile/edit_profile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(47),
                right: ScreenUtil().setWidth(38),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image(
                      image: const AssetImage(
                        'assets/icon.png',
                      ),
                      height: ScreenUtil().setHeight(200),
                      width: ScreenUtil().setWidth(200),
                    ),
                  ),
                  const EditProfileFields(
                    text: 'USERNAME',
                    labelText: 'wadood007',
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(26),
                  ),
                  const EditProfileFields(
                    text: 'NAME',
                    labelText: 'Wadood',
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(29),
                  ),
                  const EditProfileFields(
                    text: 'EMAIL',
                    labelText: 'wadoodjamal54@gmail.com',
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(25),
                  ),
                  const EditProfileFields(
                    text: 'PASSWORD',
                    labelText: '123456789',
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(32.5),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(33),
                right: ScreenUtil().setWidth(27),
                top: ScreenUtil().setHeight(32.5),
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(ScreenUtil().radius(45)),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  elevation: MaterialStateProperty.all(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(15.5),
                    bottom: ScreenUtil().setHeight(15.5),
                    right: ScreenUtil().setWidth(40),
                    left: ScreenUtil().setWidth(40),
                  ),
                  child: Text(
                    'EDIT PROFILE',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.button!.color,
                      fontSize: ScreenUtil().setSp(28),
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      fontFamily:
                          Theme.of(context).textTheme.button!.fontFamily,
                    ),
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
