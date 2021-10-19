import 'package:flutter/material.dart';
import 'package:happy_pet/constants/app_constants.dart';
import 'package:happy_pet/models/doctor_model.dart';

class CardDoctorProfile extends StatelessWidget {
  final DoctorModel doctorModel;
  const CardDoctorProfile({Key? key, required this.doctorModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      margin: EdgeInsets.only(
          bottom: defaultMargin / 2, left: defaultMargin, right: defaultMargin),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(defaultMargin * 3),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              doctorModel.imageName!,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: defaultMargin / 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: defaultMargin / 2, horizontal: defaultMargin / 3),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          doctorModel.name ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              primaryTextStyle.copyWith(fontWeight: semiBold),
                        ),
                        Text(
                          doctorModel.spesialis ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: primaryTextStyle.copyWith(
                              fontWeight: medium, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              color: ktextColor2,
                              size: 15,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "10:10 PM",
                              style: secondaryTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: light,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: ktextColor2,
                              size: 15,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                doctorModel.location ?? "",
                                style: secondaryTextStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: light,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
