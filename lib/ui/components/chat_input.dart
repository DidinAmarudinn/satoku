import 'package:flutter/material.dart';
import 'package:happy_pet/constants/app_constants.dart';

class ChatInput extends StatelessWidget {
  final TextEditingController textEditingController;
  const ChatInput({Key? key, required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: defaultMargin / 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
            hintText: "Type a message here....",
            contentPadding: EdgeInsets.all(15),
            border: InputBorder.none),
        onChanged: (value) {},
      ),
    );
  }
}
