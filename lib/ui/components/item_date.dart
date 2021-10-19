import 'package:flutter/material.dart';
import 'package:happy_pet/constants/app_constants.dart';
import 'package:happy_pet/constants/assets_path.dart';

class ItemDate extends StatelessWidget {
  final int selectedCategories;
  final int index;
  final int tgl;
  final String mont;

  const ItemDate(
      {Key? key,
      required this.selectedCategories,
      required this.index,
      required this.tgl,
      required this.mont})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      width: 60,
      decoration: BoxDecoration(
        color: index == selectedCategories ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      child: Column(
        children: [
          index == selectedCategories
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Image.asset(
                    kiconCalendarBlue,
                    width: 15,
                  ),
                )
              : SizedBox(),
          Text(
            tgl.toString(),
            style: index == selectedCategories
                ? primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  )
                : secondaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            mont,
            style: index == selectedCategories
                ? primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  )
                : secondaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: reguler,
                  ),
          ),
          index == selectedCategories
              ? Container(
                  height: 5,
                  width: 5,
                  margin: EdgeInsets.only(top: 4),
                  decoration:
                      BoxDecoration(color: kredColor, shape: BoxShape.circle),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
