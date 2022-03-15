import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhukuti/widgets/edit_profile/edit_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  String _name = '';
  String? _username;
  String? _email;
  String? _password;
  String? _address;

  void _fetchUserData() async {
    var userID = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .get()
        .then((value) {
      setState(() {
        _name = value.data()!['name'];
        _username = value.data()!['userName'];
        _password = value.data()!['password'];
        _email = value.data()!['email'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: _name.isNotEmpty
            ? ListView(
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
                        EditProfileFields(
                          text: 'USERNAME',
                          labelText: _username,
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(26),
                        ),
                        EditProfileFields(
                          text: 'NAME',
                          labelText: _name,
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(29),
                        ),
                        EditProfileFields(
                          text: 'EMAIL',
                          labelText: _email,
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(25),
                        ),
                        EditProfileFields(
                          text: 'PASSWORD',
                          labelText: _password,
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(32.5),
                        ),
                        const EditProfileFields(
                          text: 'ADDRESS',
                          labelText: 'House No., Street No., City',
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
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
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
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
