import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhukuti/widgets/create_a_group/friends_settings_buttons.dart';
import 'package:dhukuti/widgets/create_a_group/text_form_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateAGroup extends StatefulWidget {
  const CreateAGroup({Key? key}) : super(key: key);

  @override
  _CreateAGroupState createState() => _CreateAGroupState();
}

class _CreateAGroupState extends State<CreateAGroup> {
  String date = '';
  String time = '';
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String? _groupName;
  String? _addDepositingPeriod;
  String? _totalAmount;
  String? _maxPeople;

  void _setGroupName(value) {
    setState(() {
      _groupName = value;
    });
  }

  void _setAddDepositingPeriod(value) {
    setState(() {
      _addDepositingPeriod = value;
    });
  }

  void _setTotalAmount(value) {
    setState(() {
      _totalAmount = value;
    });
  }

  void _setMaxPeople(value) {
    setState(() {
      _maxPeople = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 194, 203),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: ScreenUtil().setWidth(46),
                  right: ScreenUtil().setWidth(39),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Center(
                            child: Image(
                              image: const AssetImage(
                                'assets/icon.png',
                              ),
                              height: ScreenUtil().setHeight(148),
                              width: ScreenUtil().setHeight(148),
                            ),
                          ),
                          Positioned(
                            top: ScreenUtil().setHeight(32),
                            child: GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      'CREATE A GROUP',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(28),
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontFamily:
                            Theme.of(context).textTheme.button!.fontFamily,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 52.h),
                    TextFormFields(
                      height: 22,
                      text: 'GROUP NAME',
                      func: _setGroupName,
                    ),
                    SizedBox(height: 34.h),
                    GestureDetector(
                      onTap: () async {
                        DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                        );

                        if (newDate == null) return;
                        setState(() {
                          selectedDate = newDate;
                          date = newDate.toString();
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: TextFormFields(
                              text: 'STARTING DATE',
                              height: 16,
                              labelText:
                                  '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                              isIcon: true,
                              icon: const Icon(
                                FontAwesomeIcons.calendarAlt,
                                color: Colors.black,
                                size: 16,
                              ),
                            ),
                          ),
                          SizedBox(width: ScreenUtil().setWidth(42)),
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                TimeOfDay? newTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );

                                if (newTime == null) return;

                                setState(() {
                                  selectedTime = newTime;
                                  time = selectedTime.toString();
                                });
                              },
                              child: TextFormFields(
                                text: 'TIME',
                                height: 16,
                                labelText:
                                    '$selectedTime.hour:$selectedTime.minute',
                                isIcon: true,
                                icon: const Icon(
                                  FontAwesomeIcons.clock,
                                  color: Colors.black,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 39.h),
                    TextFormFields(
                      text: 'ADD DEPOSITING PERIOD',
                      height: 22,
                      func: _setAddDepositingPeriod,
                    ),
                    SizedBox(height: 57.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: TextFormFields(
                            text: 'TOTAL AMOUNT',
                            height: 23,
                            func: _setTotalAmount,
                          ),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(52)),
                        Expanded(
                          child: TextFormFields(
                            text: 'MAX PEOPLE',
                            height: 23,
                            func: _setMaxPeople,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: FriendsSettingsButtons(
                            paddingBottom: 7,
                            paddingTop: 7,
                            paddingLeft: 13,
                            paddingRight: 1,
                            textColor: Color.fromARGB(255, 0, 194, 203),
                            backgroundColor: Colors.white,
                            borderColor: Color.fromARGB(255, 0, 194, 203),
                            buttonText: 'Invite Friends',
                          ),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(15),
                        ),
                        Expanded(
                          child: GestureDetector(
                            child: const FriendsSettingsButtons(
                              paddingBottom: 7,
                              paddingTop: 7,
                              paddingLeft: 13,
                              paddingRight: 1,
                              textColor: Color.fromARGB(255, 0, 194, 203),
                              backgroundColor: Colors.white,
                              borderColor: Color.fromARGB(255, 0, 194, 203),
                              buttonText: 'Group Setting',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(45))
                  ],
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45.r),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  elevation: MaterialStateProperty.all(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 19.h,
                    bottom: 12.h,
                    right: 27.w,
                    left: 33.w,
                  ),
                  child: Text(
                    'Create A Group',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.button!.color,
                      fontSize: 28.sp,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      fontFamily:
                          Theme.of(context).textTheme.button!.fontFamily,
                    ),
                  ),
                ),
                onPressed: () {
                  _createANewGroup();
                },
              ),
              SizedBox(height: ScreenUtil().setHeight(58)),
            ],
          ),
        ),
      ),
    );
  }

  _createANewGroup() async {
    if (_groupName != null &&
        _addDepositingPeriod != null &&
        _totalAmount != null &&
        _maxPeople != null) {
      String createdDate =
          '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}';
      String time =
          '${selectedTime.hour}:${selectedTime.minute} ${selectedTime.period.name.toUpperCase()}';

      var userId = FirebaseAuth.instance.currentUser!.uid;

      await FirebaseFirestore.instance.collection('allGroups').add({
        'groupName': _groupName,
        'groupAdmin': userId,
        'date': createdDate,
        'addDepositingPeriod': _addDepositingPeriod,
        'time': time,
        'totalAmount': _totalAmount,
        'maxPeople': _maxPeople,
        'members': [],
      });

      Navigator.pushNamed(context, '/HomePage');
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: const Text('Error'),
            content: const Text(
                'All the fields should be filled properly in order to create a group.'),
            actions: [
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
