import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhukuti/widgets/appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyGroups extends StatefulWidget {
  const MyGroups({Key? key}) : super(key: key);

  @override
  _MyGroupsState createState() => _MyGroupsState();
}

class _MyGroupsState extends State<MyGroups> {
  @override
  void initState() {
    super.initState();
    _fetchAllData();
  }

  List myGroups = [];

  void _fetchAllData() async {
    var currentUser = FirebaseAuth.instance.currentUser;

    await FirebaseFirestore.instance
        .collection('allGroups')
        .get()
        .then((value) => {
              value.docs.forEach((outerElement) {
                List members = outerElement.data()['members'];
                members.forEach((element) {
                  if (element == currentUser!.uid) {
                    setState(() {
                      myGroups.add(outerElement.data()['groupName']);
                    });
                  }
                });
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text('My Groups'),
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
              Container(
                margin: EdgeInsets.only(
                  top: ScreenUtil().setHeight(31),
                  bottom: ScreenUtil().setHeight(44),
                  left: ScreenUtil().setWidth(21),
                  right: ScreenUtil().setWidth(17),
                ),
                child: Text(
                  'My Groups',
                  style: TextStyle(
                    fontFamily: Theme.of(context).textTheme.button!.fontFamily,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(22),
                  ),
                ),
              ),
              if (myGroups.isEmpty)
                const Center(child: CircularProgressIndicator()),
              if (myGroups.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: myGroups.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Container(
                            margin: EdgeInsets.only(
                              bottom: ScreenUtil().setHeight(11),
                            ),
                            child: CircleAvatar(
                              radius: ScreenUtil().radius(22),
                              foregroundImage:
                                  const AssetImage('assets/member_iamge.png'),
                            ),
                          ),
                          title: Container(
                            margin: EdgeInsets.only(
                              bottom: ScreenUtil().setHeight(34),
                            ),
                            child: Text(
                              '${myGroups[index]}',
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: ScreenUtil().setSp(14),
                              ),
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
                )
            ],
          ),
        ),
      ),
    );
  }
}
