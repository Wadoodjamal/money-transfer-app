import 'package:dhukuti/screens/MyProfile.dart';
import 'package:dhukuti/screens/create_a_group.dart';
import 'package:dhukuti/screens/group_members.dart';
import 'package:dhukuti/screens/group_option.dart';
import 'package:dhukuti/screens/homepage.dart';
import 'package:dhukuti/screens/join_a_group.dart';
import 'package:dhukuti/screens/login.dart';
import 'package:dhukuti/screens/my_groups.dart';
import 'package:dhukuti/screens/notifications.dart';
import 'package:dhukuti/screens/settings.dart';
import 'package:dhukuti/screens/signup.dart';
import 'package:dhukuti/screens/transfer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/all_groups.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      // navigation bar color
      statusBarColor: Color.fromARGB(255, 0, 194, 203), // status bar color
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => MaterialApp(
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 0, 194, 203),
          fontFamily: 'HindVadodara',
          textTheme: TextTheme(
            button: TextStyle(
              color: Colors.grey.shade400,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/SignUp': (context) => const SignUp(),
          '/Login': (context) => const Login(),
          '/GroupOption': (context) => const GroupOption(),
          '/CreateAGroup': (context) => const CreateAGroup(),
          '/JoinAGroup': (context) => const JoinAGroup(),
          '/GroupMembers': (context) => const GroupMembers(),
          '/AllGroups': (context) => const AllGroups(),
          '/Notifications': (context) => const Notifications(),
          '/Transfer': (context) => const Transfer(),
          '/HomePage': (context) => const HomePage(),
          '/EditProfile': (context) => const EditProfile(),
          '/MyGroups': (context) => const MyGroups(),
          '/Settings': (context) => const Settings(),
        },
        initialRoute: '/SignUp',
      ),
    );
  }
}
