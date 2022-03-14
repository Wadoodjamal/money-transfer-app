import 'package:dhukuti/screens/homepage.dart';
import 'package:dhukuti/widgets/create_a_group/text_form_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class JoinAGroup extends StatefulWidget {
  const JoinAGroup({
    Key? key,
    this.snapshot,
  }) : super(key: key);

  final DocumentSnapshot? snapshot;

  @override
  _JoinAGroupState createState() => _JoinAGroupState();
}

class _JoinAGroupState extends State<JoinAGroup> {
  @override
  void initState() {
    super.initState();
    _initializeVariables();
  }

  void _initializeVariables() async {
    var groupAdminId =
        (widget.snapshot!.data() as Map<String, dynamic>)['groupAdmin'];

    await FirebaseFirestore.instance
        .collection('users')
        .doc(groupAdminId)
        .get()
        .then(
      (value) {
        setState(
          () {
            _groupAdminName = value.data()!['name'];
            _groupName =
                (widget.snapshot!.data() as Map<String, dynamic>)['groupName'];
            _date = (widget.snapshot!.data() as Map<String, dynamic>)['date'];
            _addDepositingPeriod = (widget.snapshot!.data()
                as Map<String, dynamic>)['addDepositingPeriod'];
            _time = (widget.snapshot!.data() as Map<String, dynamic>)['time'];
            _groupMembers =
                (widget.snapshot!.data() as Map<String, dynamic>)['members'];
          },
        );
      },
    );
  }

  String _groupName = '';
  String _groupAdminName = '';
  List _groupMembers = [];
  String _addDepositingPeriod = '';
  String _date = '';
  String _time = '';
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
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
                    Center(
                      child: Image(
                        image: const AssetImage(
                          'assets/icon.png',
                        ),
                        height: ScreenUtil().setHeight(148),
                        width: ScreenUtil().setHeight(148),
                      ),
                    ),
                    Text(
                      'JOIN A GROUP',
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
                      height: 6,
                      text: 'GROUP NAME',
                      labelText: _groupName,
                    ),
                    SizedBox(height: 39.h),
                    TextFormFields(
                      text: 'GROUP ADMIN',
                      height: 6,
                      labelText: _groupAdminName,
                    ),
                    SizedBox(height: 34.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {},
                            child: TextFormFields(
                              text: 'STARTING DATE',
                              height: 16,
                              labelText: _date,
                              isIcon: true,
                              icon: const Icon(
                                FontAwesomeIcons.calendarAlt,
                                color: Colors.black,
                                size: 16,
                              ),
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
                                _time = selectedTime.toString();
                              });
                            },
                            child: TextFormFields(
                              text: 'TIME',
                              height: 16,
                              labelText: _time,
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
                    SizedBox(height: 37.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: TextFormFields(
                            text: 'DEPOSITING PERIOD',
                            height: 0,
                            labelText: _addDepositingPeriod,
                          ),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(52)),
                        Expanded(
                          child: TextFormFields(
                            text: 'GROUP MEMBERS',
                            height: 0,
                            labelText: _groupMembers.length.toString(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(36),
                    ),
                  ],
                ),
              ),
              MemberDetails(
                members: _groupMembers,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(22),
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
                    'Join A Group',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28.sp,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      fontFamily:
                          Theme.of(context).textTheme.button!.fontFamily,
                    ),
                  ),
                ),
                onPressed: () => {
                  _updateMembers(),
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  ),
                },
              ),
              SizedBox(height: ScreenUtil().setHeight(58)),
            ],
          ),
        ),
      ),
    );
  }

  void _updateMembers() async {
    var docID = '';
    await FirebaseFirestore.instance.collection('allGroups').get().then(
      (value) {
        value.docs.forEach(
          (doc) => {
            if (doc.data()['groupName'] == _groupName)
              {
                docID = doc.id,
              }
          },
        );
      },
    );

    var currentuser = FirebaseAuth.instance.currentUser!.uid;
    _groupMembers.add(currentuser);
    // update the members in the group
    FirebaseFirestore.instance.collection('allGroups').doc(docID).update(
      {
        'members': _groupMembers,
      },
    );
  }
}

class MemberDetails extends StatelessWidget {
  const MemberDetails({
    Key? key,
    this.members,
  }) : super(key: key);

  final List? members;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(33),
        top: ScreenUtil().setHeight(11),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ScreenUtil().radius(35)),
        color: Colors.white,
      ),
      width: ScreenUtil().setWidth(318),
      height: ScreenUtil().setHeight(164),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'MEMBER DETAILS',
            style: TextStyle(
              fontFamily: Theme.of(context).textTheme.button!.fontFamily,
              fontSize: ScreenUtil().setSp(16),
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(14),
          ),
          if (members!.isEmpty)
            Center(
              widthFactor: double.infinity,
              child: Text(
                'No members added yet',
                style: TextStyle(
                  fontFamily: Theme.of(context).textTheme.button!.fontFamily,
                  fontSize: ScreenUtil().setSp(18),
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          if (members!.isNotEmpty)
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(right: ScreenUtil().setWidth(40)),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: ScreenUtil().radius(22),
                            foregroundImage:
                                const AssetImage('assets/member_iamge.png'),
                          ),
                          title: Text(
                            'MEMBER ${index + 1} NAME',
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                              fontSize: ScreenUtil().setSp(14),
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Theme.of(context).primaryColor,
                            size: ScreenUtil().setHeight(18),
                          ),
                        ),
                      ),
                      Divider(
                        height: ScreenUtil().setHeight(3),
                        color: const Color.fromARGB(255, 222, 225, 239),
                      )
                    ],
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
