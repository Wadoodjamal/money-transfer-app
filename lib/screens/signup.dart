import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhukuti/widgets/signup/signup_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? _username = 'Empty';
  String? _email = 'Empty';
  String? _name = 'Empty';
  String? _password = 'Empty';

  void _setPassword(value) {
    setState(() {
      _password = value;
    });
  }

  void _setUsername(value) {
    setState(() {
      _username = value;
    });
  }

  void _setName(value) {
    setState(() {
      _name = value;
    });
  }

  void _setEmail(value) {
    setState(() {
      _email = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: ListView(children: [
          Container(
            margin: EdgeInsets.only(
              left: ScreenUtil().setWidth(47),
              right: ScreenUtil().setWidth(38),
            ),
            child: Form(
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
                  SignUpFields(
                    text: 'USERNAME',
                    func: _setUsername,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(26),
                  ),
                  SignUpFields(
                    text: 'NAME',
                    func: _setName,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(29),
                  ),
                  SignUpFields(
                    text: 'EMAIL',
                    func: _setEmail,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(25),
                  ),
                  SignUpFields(
                    text: 'PASSWORD',
                    func: _setPassword,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(32.5),
                  ),
                ],
              ),
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
                  top: ScreenUtil().setHeight(18),
                  bottom: ScreenUtil().setHeight(13),
                  right: ScreenUtil().setWidth(75),
                  left: ScreenUtil().setWidth(77),
                ),
                child: Text(
                  'SIGN UP',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.button!.color,
                    fontSize: ScreenUtil().setSp(28),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700,
                    fontFamily: Theme.of(context).textTheme.button!.fontFamily,
                  ),
                ),
              ),
              onPressed: () {
                if (_checkValidity()) {
                  _registerNewUser();
                } else {
                  print('Error registering user.');
                }
              },
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/Login');
              },
              child: Text('Already have an account? Sign In.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(18),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontFamily: Theme.of(context).textTheme.button!.fontFamily,
                  )),
            ),
          ),
        ]),
      ),
    );
  }

  bool _checkValidity() {
    if (_username != 'Empty') {
      if (_name != 'Empty') {
        if (_email! != 'Empty' || !_email!.contains('@')) {
          if (_password != 'Empty' && _password!.length < 8) {}
        }
      }
      return true;
    } else {
      return false;
    }
  }

  void _registerNewUser() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email!, password: _password!)
          .then((value) => {
                print(value),
              });

      User user = FirebaseAuth.instance.currentUser!;
      // print(user.uid);

      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'name': _name!,
        'email': _email!,
        'password': _password!,
        'userName': _username!,
      });
      Navigator.pushNamed(context, '/GroupOption');
    } catch (error) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('The email is already in use.'),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }
}
