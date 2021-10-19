import 'package:flutter/material.dart';
import 'package:happy_pet/constants/app_constants.dart';
import 'package:happy_pet/constants/assets_path.dart';
import 'package:happy_pet/ui/components/item_date.dart';

class HeaderProfileWidget extends StatelessWidget {
  final Function onPressed;
  final DateTime now;
  final int selected;
  const HeaderProfileWidget(
      {Key? key,
      required this.onPressed,
      required this.now,
      required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: defaultMargin, right: defaultMargin, left: defaultMargin),
            decoration: BoxDecoration(
              color: kbackgroundColor2,
            ),
            height: MediaQuery.of(context).size.height * 0.23,
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                        kimageProfieDummy,
                      ),
                    ),
                    SizedBox(
                      width: defaultMargin / 3,
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Andhika",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: primaryTextStyle.copyWith(
                                fontSize: 24,
                                fontWeight: bold,
                              ),
                            ),
                            Text(
                              "Joined since 2021",
                              style: secondaryTextStyle.copyWith(
                                  fontWeight: light),
                            ),
                            Text(
                              "0878798174123",
                              style: secondaryTextStyle.copyWith(
                                  fontWeight: light),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 90,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: kbackgroundColor2,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(defaultMargin * 2),
                    ),
                  ),
                ),
                ListView.builder(
                    itemCount: 15,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          onPressed(index);
                        },
                        child: ItemDate(
                            selectedCategories: selected,
                            index: index,
                            tgl: 2 + index,
                            mont: "SEP"),
                      );
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
