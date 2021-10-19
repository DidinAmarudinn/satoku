import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:happy_pet/constants/app_constants.dart';
import 'package:happy_pet/constants/assets_path.dart';
import 'package:happy_pet/models/doctor_model.dart';
import 'package:happy_pet/ui/components/custom_button.dart';
import 'package:happy_pet/ui/screens/chat_screen.dart';

class DialogInfoDoctor extends StatelessWidget {
  final DoctorModel doctorModel;
  final Function onPressed;
  const DialogInfoDoctor(
      {Key? key, required this.doctorModel, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _infoDoc(String icon, String title, String desc) {
      return Row(
        children: [
          Image.asset(icon, width: 25),
          SizedBox(
            width: defaultMargin / 3,
          ),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: primaryTextStyle.copyWith(fontWeight: light),
                  ),
                  Text(
                    desc,
                    style: secondaryTextStyle.copyWith(
                        fontSize: 12, fontWeight: light),
                  ),
                ]),
          )
        ],
      );
    }

    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              doctorModel.imageName!,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: defaultMargin / 2,
            ),
            Text(
              doctorModel.name ?? "",
              style: primaryTextStyle.copyWith(fontWeight: medium),
            ),
            SizedBox(
              height: defaultMargin / 4,
            ),
            Text(
              doctorModel.spesialis ?? "",
              style: primaryTextStyle.copyWith(fontWeight: light, fontSize: 12),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Flexible(
                child: Column(
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
                      height: defaultMargin / 4,
                    ),
                    Text("(1.5K review)", style: secondaryTextStyle),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  children: [
                    RatingBarIndicator(
                      rating: 1.0,
                      itemBuilder: (context, index) => Icon(
                        Icons.medication,
                        color: Colors.redAccent,
                      ),
                      itemCount: 1,
                      itemSize: 15.0,
                      direction: Axis.horizontal,
                    ),
                    SizedBox(
                      height: defaultMargin / 4,
                    ),
                    Text("3 Years", style: secondaryTextStyle),
                  ],
                ),
              )
            ]),
            SizedBox(
              height: defaultMargin,
            ),
            _infoDoc(kiconUniversity, "Graduated From", "UGM"),
            SizedBox(
              height: defaultMargin / 2,
            ),
            _infoDoc(kiconLocation, "Places of practice",
                "Jl. Akasia Delphina No. 200 Bumi Harapan Baru, Kab.Bandung"),
            SizedBox(
              height: defaultMargin / 2,
            ),
            _infoDoc(kiconIjazah, "Ijazah", "SKD/2017/20021121446"),
            SizedBox(
              height: defaultMargin,
            ),
            CustomButtonWidget(
                buttonName: "Chat",
                onPressed: () {
                  onPressed();
                },
                height: 40,
                width: double.infinity,
                color: kbgbutton1)
          ],
        ),
      ),
    );
  }
}
