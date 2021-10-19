import 'package:flutter/material.dart';
import 'package:happy_pet/constants/app_constants.dart';

class HeaderChatScreen extends StatelessWidget {
  final String namaDokter;
  final String imageName;
  final Function onpressed;
  const HeaderChatScreen(
      {Key? key,
      required this.namaDokter,
      required this.imageName,
      required this.onpressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: defaultMargin / 2, vertical: defaultMargin / 3),
      color: Colors.white,
      child: Row(children: [
        Icon(
          Icons.arrow_back,
        ),
        SizedBox(
          width: defaultMargin / 2,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.asset(
            imageName,
            fit: BoxFit.cover,
            height: 50,
            width: 50,
          ),
        ),
        SizedBox(
          width: defaultMargin / 2,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                namaDokter,
                style: primaryTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(
                height: defaultMargin / 3,
              ),
              Text(
                "Online",
                style: secondaryTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            onpressed();
          },
          child: Text(
            "End",
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
        SizedBox(width: defaultMargin / 2),
        Icon(
          Icons.more_vert,
        ),
      ]),
    );
  }
}
