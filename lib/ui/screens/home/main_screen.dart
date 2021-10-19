import 'package:flutter/material.dart';
import 'package:happy_pet/ui/screens/home/calendar_screen.dart';
import 'package:happy_pet/ui/screens/home/chat_history_screen.dart';
import 'package:happy_pet/ui/screens/home/home_screen.dart';
import 'package:happy_pet/ui/screens/home/notification_screen.dart';
import 'package:happy_pet/ui/screens/home/profile_screen.dart';
import 'package:happy_pet/ui/widgets/bottom_nav.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedNavbar = 0;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  final screen = [
    const HomeScreen(),
    const CalendarScreen(),
    const NotficationScreen(),
    const ChatHistoryScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[_selectedNavbar],
      bottomNavigationBar: BottomNavBasic(
          ontap: _changeSelectedNavBar, selectedIndex: _selectedNavbar),
    );
  }
}
