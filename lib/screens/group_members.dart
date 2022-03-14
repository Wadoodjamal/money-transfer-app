import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhukuti/widgets/appbar.dart';
import 'package:dhukuti/widgets/bottom_navigation_bar.dart';
import 'package:dhukuti/widgets/group%20members/group_members_list_tile.dart';
import 'package:dhukuti/widgets/group%20members/test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GroupMembers extends StatefulWidget {
  const GroupMembers({Key? key}) : super(key: key);

  @override
  _GroupMembersState createState() => _GroupMembersState();
}

class _GroupMembersState extends State<GroupMembers> {
  @override
  void initState() {
    super.initState();
    _getGroupMembers();
  }

  void _getGroupMembers() async {
    List groupMembersUID = [];
    var currentUserId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection('allGroups').get().then(
          (value) => value.docs.forEach(
            (element) {
              if (element.data()['members'].contains(currentUserId)) {
                element.data()['members'].forEach(
                      (element) => groupMembersUID.add(element),
                    );
              }
            },
          ),
        );

    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((value) => value.docs.forEach((element) {
              if (groupMembersUID.contains(element.id)) {
                setState(() {
                  groupMembersList.add(element.data()['name']);
                });
              }
            }));
    print(groupMembersList);
  }

  List groupMembersList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const CustomBottomNavigationBar(),
        appBar: AppBar(
          title: const Text('Group Members'),
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
              const Test(),
              GroupMembersListTile(
                groupMembers: groupMembersList,
              )
            ],
          ),
        ),
      ),
    );
  }
}
