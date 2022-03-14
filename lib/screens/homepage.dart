import 'package:dhukuti/widgets/bottom_navigation_bar.dart';
import 'package:dhukuti/widgets/drawer.dart';
import 'package:dhukuti/widgets/homepage/app_bar_welcome.dart';
import 'package:dhukuti/widgets/homepage/payment_make_schedule.dart';
import 'package:dhukuti/widgets/homepage/tansactions_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Text _textDatesMember(BuildContext context, String text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: Theme.of(context).textTheme.button!.fontFamily,
        fontSize: ScreenUtil().setSp(14),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const CustomBottomNavigationBar(),
        backgroundColor: Colors.white,
        drawer: const NavigationDrawer(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: const [
                  AppBarWelcome(),
                  PaymentMakeSchedule(),
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(184),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(58),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _textDatesMember(context, 'Next Repayment: 11/01/22'),
                    SizedBox(
                      height: ScreenUtil().setHeight(8),
                    ),
                    _textDatesMember(context, 'Starting Date: 10/01/22'),
                    SizedBox(
                      height: ScreenUtil().setHeight(8),
                    ),
                    _textDatesMember(context, 'Ending Date: 10/01/22'),
                    SizedBox(
                      height: ScreenUtil().setHeight(17),
                    ),
                    _textDatesMember(context, 'Next Turn: John Doe'),
                  ],
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(49),
              ),
              TransactionsButton(
                callback: () => Navigator.pushNamed(context, '/Transfer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
