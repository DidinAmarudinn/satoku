import 'package:flutter/material.dart';
import 'package:happy_pet/constants/app_constants.dart';

class BottomNavBasic extends StatelessWidget {
  final Function(int) ontap;
  final int selectedIndex;
  const BottomNavBasic(
      {Key? key, required this.ontap, required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: "Notification",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: "Notification",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_sharp),
          label: "Profile",
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: kbackgroundColor2,
      unselectedItemColor: Colors.grey,
      iconSize: 24,
      //labels
      showUnselectedLabels: false,
      showSelectedLabels: false,
      onTap: (index) {
        ontap(index);
      },
    );
  }
}
