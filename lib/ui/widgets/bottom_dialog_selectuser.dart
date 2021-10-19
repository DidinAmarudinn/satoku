import 'package:flutter/material.dart';
import 'package:happy_pet/constants/app_constants.dart';

class BottomDialogSelectUser extends StatelessWidget {
  final int selectedIndex;
  final Function(int) ontap;
  const BottomDialogSelectUser(
      {Key? key, required this.selectedIndex, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _itemConsult(String label, int index) {
      return Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(
              horizontal: defaultMargin / 2, vertical: defaultMargin / 3),
          decoration: BoxDecoration(
            color: index == selectedIndex
                ? Colors.grey.shade300
                : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label,
                  style: primaryTextStyle.copyWith(
                      fontWeight: index == selectedIndex ? semiBold : reguler)),
              index == selectedIndex
                  ? Icon(Icons.check, color: kbgbutton1)
                  : SizedBox()
            ],
          ));
    }

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(defaultMargin),
        child: Column(children: [
          GestureDetector(
              onTap: () {
                ontap(0);
              },
              child: _itemConsult("User", 0)),
          SizedBox(height: defaultMargin / 3),
          GestureDetector(
              onTap: () {
                ontap(1);
              },
              child: _itemConsult("Seller", 1)),
        ]),
      ),
    );
  }
}
