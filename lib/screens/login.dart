import 'package:dhukuti/widgets/signin/login_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<Login> {
  String username = 'empty string';
  String password = 'empty string';
  bool isUser = false;

  void _setUsername(value) {
    setState(() {
      username = value;
    });
  }

  void _setPassword(value) {
    setState(() {
      password = value;
    });
  }

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
                  SizedBox(
                    height: ScreenUtil().setHeight(38),
                  ),
                  SignInFields(
                    marginInBetween: 25,
                    text: 'Email',
                    func: _setUsername,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(38),
                  ),
                  SignInFields(
                    marginInBetween: 25,
                    text: 'PASSWORD',
                    func: _setPassword,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: ScreenUtil().setHeight(148.5),
                  left: ScreenUtil().setWidth(27),
                  right: ScreenUtil().setWidth(33)),
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
                    top: ScreenUtil().setHeight(18),
                    bottom: ScreenUtil().setHeight(13),
                    right: ScreenUtil().setWidth(75),
                    left: ScreenUtil().setWidth(77),
                  ),
                  child: Text(
                    'LOGIN',
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
                onPressed: () {
                  _signInUser();
                },
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/SignUp');
                },
                child: Text(
                  "Don't have an account? Sign Up.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(18),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontFamily: Theme.of(context).textTheme.button!.fontFamily,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // TODO: check whether a user is signed up or not
  void _signInUser() async {
    try {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: username, password: password)
          .then((value) => {
                print(value.user!.email),
                setState(() {
                  isUser = true;
                })
              });
    } catch (err) {
      print('error is: ${err.toString()}');
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text(err.toString()),
              actions: [
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });
      setState(() {
        isUser = false;
      });
    }

    if (isUser) {
      Navigator.pushNamed(context, '/GroupOption');
    }
  }
}
