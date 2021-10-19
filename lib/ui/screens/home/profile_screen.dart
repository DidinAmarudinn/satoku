import 'package:flutter/material.dart';
import 'package:happy_pet/constants/app_constants.dart';
import 'package:happy_pet/ui/components/custom_appbar.dart';
import 'package:happy_pet/ui/widgets/content_profile.dart';
import 'package:happy_pet/ui/widgets/header_profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor1,
      appBar: PreferredSize(
        child: CustomAppbar(
          color: kbackgroundColor2,
          title: "Profile",
          isProfile: true,
        ),
        preferredSize: Size.fromHeight(56),
      ),
      body: ListView(
        children: [
          HeaderProfileWidget(
            onPressed: (index) {
              setState(() {
                _selectedValue = index;
                print(index);
              });
            },
            selected: _selectedValue,
            now: DateTime.now(),
          ),
          ContentProfile()
        ],
      ),
    );
  }
}
