import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_pet/constants/app_constants.dart';
import 'package:happy_pet/constants/assets_path.dart';

class DialogEndChat extends StatelessWidget {
  final Function onClose;
  final Function openFeedback;
  const DialogEndChat(
      {Key? key, required this.onClose, required this.openFeedback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              kiconEndchat,
              width: 100,
            ),
            SizedBox(height: defaultMargin / 2),
            Text("Are you sure to end this session?", style: primaryTextStyle),
            SizedBox(height: defaultMargin / 2),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey.shade400,
                  ),
                  onPressed: () {
                    onClose();
                  },
                  child: Container(
                    width: 60,
                    child: Center(child: Text("Cancel")),
                  )),
              SizedBox(width: defaultMargin),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kbgbutton2,
                  ),
                  onPressed: () {
                    openFeedback();
                  },
                  child: Container(
                    width: 60,
                    child: Center(child: Text("Sure")),
                  )),
            ])
          ],
        ),
      ),
    );
  }
}
