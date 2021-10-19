import 'package:flutter/material.dart';
import 'package:happy_pet/constants/app_constants.dart';
import 'package:happy_pet/constants/assets_path.dart';

class BottomDialogSelectConsult extends StatelessWidget {
  final Function onTapNow;
  final Function onTapBook;
  const BottomDialogSelectConsult(
      {Key? key, required this.onTapNow, required this.onTapBook})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _itemConsult(String label, String desc, int index) {
      return Container(
        padding: EdgeInsets.symmetric(
            horizontal: defaultMargin / 2, vertical: defaultMargin / 3),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Image.asset(
              index == 0 ? kiconConsultNow : kiconBookConsult,
              width: 30,
            ),
            SizedBox(width: defaultMargin / 2),
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label,
                        style: primaryTextStyle.copyWith(fontWeight: semiBold)),
                    Text(desc,
                        style: secondaryTextStyle.copyWith(
                            fontWeight: light, fontSize: 12)),
                  ]),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(defaultMargin),
        child: Column(children: [
          GestureDetector(
              onTap: () {
                onTapNow();
              },
              child: _itemConsult(
                  "Consult now", "Start your consultation immediately", 0)),
          SizedBox(height: defaultMargin / 3),
          GestureDetector(
            onTap: () {
              onTapBook();
            },
            child: _itemConsult(
                "Book a consultation", "Schedule a session for later", 1),
          ),
        ]),
      ),
    );
  }
}
