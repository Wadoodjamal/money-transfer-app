import 'package:flutter/material.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 1;

  void navigation() {
    if (_currentIndex == 0) {
      Navigator.pushNamed(context, '/JoinAGroup');
    } else if (_currentIndex == 1) {
      Navigator.pushNamed(context, '/HomePage');
    } else {
      Navigator.pushNamed(context, '/CreateAGroup');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: _currentIndex,
      onTap: (i) {
        setState(() => _currentIndex = i);
        navigation();
        setState(() => _currentIndex = 1);
      },
      items: [
        SalomonBottomBarItem(
          icon: Icon(
            Icons.group_add,
            color: Theme.of(context).primaryColor,
          ),
          title: const Text("Join"),
          selectedColor: Theme.of(context).primaryColor,
        ),

        /// Home
        SalomonBottomBarItem(
          icon: Icon(
            Icons.home,
            color: Theme.of(context).primaryColor,
          ),
          title: const Text("Home"),
          selectedColor: Theme.of(context).primaryColor,
        ),

        /// Profile
        SalomonBottomBarItem(
          icon: Icon(
            Icons.group,
            color: Theme.of(context).primaryColor,
          ),
          title: const Text("Create"),
          selectedColor: Theme.of(context).primaryColor,
        ),
      ],
    );
  }
}
