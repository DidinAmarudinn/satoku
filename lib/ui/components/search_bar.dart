import 'package:flutter/material.dart';
import 'package:happy_pet/constants/app_constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: defaultMargin / 3),
      decoration: BoxDecoration(
        color: kbackgroundColor3,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search_outlined,
            color: kbgbutton2,
          ),
          Text(
            "Search Doctors & Hospitals",
            style: greenTextStyle.copyWith(fontSize: 12, fontWeight: light),
          ),
        ],
      ),
    );
  }
}
