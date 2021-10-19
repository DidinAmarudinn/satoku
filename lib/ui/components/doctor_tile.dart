import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:happy_pet/constants/app_constants.dart';
import 'package:happy_pet/models/doctor_model.dart';

class DoctorTile extends StatelessWidget {
  final DoctorModel doctorModel;
  const DoctorTile({Key? key, required this.doctorModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: EdgeInsets.symmetric(
          horizontal: defaultMargin / 2, vertical: defaultMargin / 2),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
          horizontal: defaultMargin, vertical: defaultMargin / 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(doctorModel.imageName!,
                width: 100, fit: BoxFit.cover, height: 100),
          ),
          SizedBox(width: defaultMargin / 2),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorModel.name ?? "",
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                Row(
                  children: [
                    RatingBarIndicator(
                      rating: 1.0,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 1,
                      itemSize: 15.0,
                      direction: Axis.horizontal,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text("(1.5K review)", style: secondaryTextStyle),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      "3 Years",
                    )),
                    Container(
                      decoration: BoxDecoration(
                        color: kbgbutton1,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: defaultMargin / 2,
                          vertical: defaultMargin / 5),
                      child: Text(
                        "Chat",
                        style: whiteTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
