import 'package:app/pages/show_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.pushNamed(context, "/home");
          break;
        case 1:
          Navigator.pushNamed(context, "/recommendation");
          break;
        case 2:
          Navigator.pushNamed(context, "/add");
          break;
        case 3:
          Navigator.pushNamed(context, "/statistics",
              arguments: NamedArgument(
                  "This is a title",
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                  [
                    "This is the first",
                    "This is the second",
                    "This is the third",
                    "This is the fourth",
                  ]));
          break;
        case 4:
          Navigator.pushNamed(context, "/savings");
          break;
      }

      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Recommendations",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_box_outlined),
          label: "New post",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.health_and_safety_rounded),
          label: "Acitivity",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: "Profile",
        ),
      ],
      currentIndex: _selectedIndex,
      showUnselectedLabels: false,
      showSelectedLabels: true,
      onTap: _onItemTapped,
    );
  }
}
