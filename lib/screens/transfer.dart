import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhukuti/widgets/appbar.dart';
import 'package:dhukuti/widgets/transfers/amount_to_member.dart';
import 'package:dhukuti/widgets/transfers/calculate_grid.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Transfer extends StatefulWidget {
  const Transfer({Key? key}) : super(key: key);

  @override
  _TransferState createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  String _amount = '';
  String? _memberName;

  final List _calculate = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '.',
    '0',
    Icons.arrow_forward_outlined
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Transfer'),
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomAppBar(),
              SizedBox(
                height: ScreenUtil().setHeight(69),
              ),
              AmountTo(
                textColor: Theme.of(context).primaryColor,
                text: 'Enter Amount',
              ),
              SizedBox(
                height: ScreenUtil().setHeight(21),
              ),
              Text(
                _amount.isEmpty ? 'RS 0' : 'RS $_amount',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: Theme.of(context).textTheme.button!.fontFamily,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil().setSp(36),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(
                    left: ScreenUtil().setWidth(75),
                    right: ScreenUtil().setWidth(76),
                    bottom: ScreenUtil().setHeight(22),
                  ),
                  child: Divider(
                    color: Theme.of(context).primaryColor,
                  )),
              AmountTo(
                textColor: Theme.of(context).primaryColor,
                text: 'To',
              ),
              Container(
                margin: EdgeInsets.only(
                  left: ScreenUtil().setWidth(70),
                  bottom: ScreenUtil().setHeight(54),
                ),
                child: ListTile(
                  leading: Container(
                    margin: EdgeInsets.only(
                      bottom: ScreenUtil().setHeight(11),
                    ),
                    child: CircleAvatar(
                      foregroundImage:
                          const AssetImage('assets/member_iamge.png'),
                      radius: ScreenUtil().radius(22),
                    ),
                  ),
                  title: TextField(
                    onChanged: (value) {
                      setState(() {
                        _memberName = value;
                        print(_memberName);
                      });
                    },
                    decoration:
                        InputDecoration.collapsed(hintText: 'MEMBER NAME'),
                  ),
                ),
              ),
              CalculateGrid(
                items: _calculate,
                callback: () => {
                  _makeTransaction(),
                },
                func: _sum,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _sum(value) {
    setState(() {
      _amount += value;
    });
  }

  void _makeTransaction() async {
    var firestore = FirebaseFirestore.instance;
    bool _isUserFound = false;
    await firestore.collection('users').get().then((value) => {
          value.docs.forEach((element) {
            if (element.data()['name'].toString().toLowerCase() ==
                _memberName!.toLowerCase()) {
              _isUserFound = true;
            }
          })
        });

    if (_isUserFound) {
      String? currentMember;
      var date = {
        "date": DateTime.now().day,
        "month": DateTime.now().month,
        "year": DateTime.now().year
      };
      var time = {
        "hour": DateTime.now().hour,
        "minute": DateTime.now().minute,
        "second": DateTime.now().second,
      };
      var userID = FirebaseAuth.instance.currentUser!.uid;
      await firestore
          .collection('users')
          .doc(userID)
          .get()
          .then((value) => {currentMember = value.data()!['name']});

      await firestore.collection('transactions').add({
        'amount': _amount,
        'from': currentMember,
        'to': _memberName,
        'date': date,
        'time': time,
      });
      Navigator.pushNamed(context, '/Notifications');
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Member Not Found'),
            content: const Text('Please check the member name'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      );
    }
  }
}
