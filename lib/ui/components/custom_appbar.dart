import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_pet/constants/app_constants.dart';

class CustomAppbar extends StatelessWidget {
  final Color color;
  final String title;
  final bool isDefault;
  final bool isProfile;

  const CustomAppbar(
      {Key? key,
      required this.color,
      required this.title,
      this.isDefault = false,
      this.isProfile = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title, style: secondaryTextStyle),
      elevation: 0,
      leading: isDefault
          ? IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: ktextColor2,
              ),
            )
          : SizedBox(),
      backgroundColor: color,
      actions: [],
    );
  }
}
