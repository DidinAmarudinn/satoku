import 'package:flutter/material.dart';
import 'package:happy_pet/constants/app_constants.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool? isCenter;
  final bool? isEnable;
  const CustomTextField(
      {Key? key,
      required this.label,
      required this.controller,
      this.isCenter = false,
      this.isEnable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                width: 1,
                color: kprimarytextColor.withOpacity(0.2),
                style: BorderStyle.solid)),
        child: TextField(
          enabled: isEnable,
          textAlign: isCenter! ? TextAlign.center : TextAlign.left,
          decoration: InputDecoration(
              hintText: label,
              prefix: isEnable!
                  ? SizedBox()
                  : Icon(Icons.arrow_drop_down,
                      color: kprimarytextColor, size: 24),
              contentPadding: EdgeInsets.all(15),
              border: InputBorder.none),
          onChanged: (value) {},
        ),
      ),
    );
  }
}
