import 'package:flutter/material.dart';
import 'package:happy_pet/constants/app_constants.dart';
import 'package:happy_pet/models/doctor_model.dart';
import 'package:happy_pet/ui/components/card_doctor_profile.dart';

class ContentProfile extends StatelessWidget {
  const ContentProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: defaultMargin, vertical: defaultMargin / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Filter",
                  style: secondaryTextStyle,
                ),
                SizedBox(
                  width: 6,
                ),
                Icon(
                  Icons.filter_list_outlined,
                  size: 25,
                ),
              ],
            ),
          ),
          Column(
            children: mockDoctorModel.map((e) {
              return CardDoctorProfile(
                doctorModel: e,
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
