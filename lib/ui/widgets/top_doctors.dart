import 'package:flutter/material.dart';
import 'package:happy_pet/constants/app_constants.dart';
import 'package:happy_pet/models/doctor_model.dart';
import 'package:happy_pet/ui/components/card_doctor.dart';

class TopDoctorsWidget extends StatelessWidget {
  final List<DoctorModel> doctorModel;
  const TopDoctorsWidget({Key? key, required this.doctorModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Text(
              "Top Doctors",
              style:
                  primaryTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: defaultMargin / 2),
            height: 150,
            child: ListView.builder(
              itemCount: doctorModel.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                DoctorModel data = doctorModel[index];
                return CardDoctor(
                  doctorModel: data,
                  isBlue: index.isEven ? true : false,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
