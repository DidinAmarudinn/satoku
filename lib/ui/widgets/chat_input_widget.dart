import 'package:flutter/material.dart';
import 'package:happy_pet/constants/app_constants.dart';

class ChatInputWidget extends StatelessWidget {
  const ChatInputWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            width: double.infinity,
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin * 0.8,
              vertical: defaultMargin / 2,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: TextFormField(
                style: primaryTextStyle,
                decoration: InputDecoration.collapsed(
                  hintText: "Type message here....",
                  hintStyle: subtitleTextStyle,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(color: kbgbutton2),
          ),
        ),
      ],
    );
  }
}
