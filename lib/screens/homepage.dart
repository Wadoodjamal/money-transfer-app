import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhukuti/widgets/bottom_navigation_bar.dart';
import 'package:dhukuti/widgets/drawer.dart';
import 'package:dhukuti/widgets/homepage/app_bar_welcome.dart';
import 'package:dhukuti/widgets/homepage/payment_make_schedule.dart';
import 'package:dhukuti/widgets/homepage/tansactions_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  String _name = '';
  String _userName = '';
  int _totalTransactionsBalance = 0;

  void _fetchUserData() async {
    var userId = FirebaseAuth.instance.currentUser?.uid;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get()
        .then((value) {
      setState(() {
        _name = value.data()!['name'];
        _userName = value.data()!['userName'];
      });
    });

    await FirebaseFirestore.instance
        .collection('transactions')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        if (element.data()['from'] == _name || element.data()['to'] == _name) {
          setState(() {
            _totalTransactionsBalance += int.parse(element.data()['amount']);
          });
        }
      });
    });
  }

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
        drawer: NavigationDrawer(name: _name, username: _userName),
        body: SingleChildScrollView(
          child: _userName.isNotEmpty && _name.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      clipBehavior: Clip.none,
                      children: [
                        AppBarWelcome(
                          name: _name,
                        ),
                        PaymentMakeSchedule(
                            transactions: _totalTransactionsBalance),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(154),
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
                      height: ScreenUtil().setHeight(100),
                    ),
                    TransactionsButton(
                      callback: () => Navigator.pushNamed(context, '/Transfer'),
                    ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
