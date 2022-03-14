import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhukuti/screens/join_a_group.dart';
import 'package:dhukuti/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllGroups extends StatefulWidget {
  const AllGroups({Key? key}) : super(key: key);

  @override
  _AllGroupsState createState() => _AllGroupsState();
}

class _AllGroupsState extends State<AllGroups> {
  @override
  void initState() {
    super.initState();
    _fetchAllGroups();
  }

  QuerySnapshot? querySnapshot;
  List<DocumentSnapshot>? documents = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Groups List'),
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
                  'All Groups',
                  style: TextStyle(
                    fontFamily: Theme.of(context).textTheme.button!.fontFamily,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(22),
                  ),
                ),
              ),
              if (documents!.isEmpty)
                const Center(child: CircularProgressIndicator()),
              ListView.builder(
                shrinkWrap: true,
                itemCount: documents!.length,
                itemBuilder: (context, index) {
                  var groupName = (documents![index].data()
                      as Map<String, dynamic>)['groupName'];

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
                            '$groupName',
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                              fontSize: ScreenUtil().setSp(14),
                            ),
                          ),
                        ),
                        trailing: GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => JoinAGroup(
                                snapshot: documents![index],
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Join Group',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).primaryColor,
                                  fontStyle: FontStyle.normal,
                                  fontSize: ScreenUtil().setSp(14),
                                  fontFamily: Theme.of(context)
                                      .textTheme
                                      .button!
                                      .fontFamily,
                                ),
                              ),
                              SizedBox(
                                width: ScreenUtil().setWidth(8),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Theme.of(context).primaryColor,
                                size: ScreenUtil().setHeight(18),
                              ),
                            ],
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
            ],
          ),
        ),
      ),
    );
  }

  void _fetchAllGroups() async {
    querySnapshot =
        await FirebaseFirestore.instance.collection('allGroups').get();

    setState(() {
      documents = querySnapshot!.docs;
    });
  }
}
