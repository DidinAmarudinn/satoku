import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:happy_pet/constants/app_constants.dart';
import 'package:happy_pet/constants/assets_path.dart';
import 'package:happy_pet/models/doctor_model.dart';
import 'package:happy_pet/ui/components/custom_button.dart';

class DialogFeedback extends StatelessWidget {
  final DoctorModel doctorModel;
  final Function onSubmit;
  const DialogFeedback(
      {Key? key, required this.doctorModel, required this.onSubmit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: defaultMargin),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: Builder(
        builder: (context) {
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;

          return Container(
              height: height * 0.7,
              width: width,
              child: Column(
                children: [
                  Text(
                    "Session ID SATO-2193813",
                    style: secondaryTextStyle.copyWith(
                        fontSize: 12, fontWeight: light),
                  ),
                  SizedBox(height: defaultMargin / 2),
                  Text("The session has ended",
                      style: primaryTextStyle.copyWith(fontWeight: semiBold)),
                  SizedBox(height: defaultMargin / 2),
                  Divider(),
                  SizedBox(height: defaultMargin / 2),
                  Text("How is your Doctor ?",
                      style: primaryTextStyle.copyWith(
                          fontWeight: semiBold, fontSize: 20)),
                  SizedBox(height: defaultMargin),
                  CircleAvatar(
                    radius: height * 0.05,
                    foregroundImage: AssetImage(doctorModel.imageName!),
                  ),
                  SizedBox(height: defaultMargin),
                  Text(
                    doctorModel.name ?? "",
                    style: primaryTextStyle,
                  ),
                  SizedBox(height: defaultMargin),
                  RatingBarIndicator(
                    rating: doctorModel.rating ?? 0.0,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 25.0,
                    direction: Axis.horizontal,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: defaultMargin),
                    alignment: Alignment.center,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: defaultMargin / 3),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade200),
                      child: Row(
                        children: [
                          Image.asset(
                            kiconFeedback,
                            width: 25,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "Type feedback here...",
                                  contentPadding: EdgeInsets.all(15),
                                  border: InputBorder.none),
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  CustomButtonWidget(
                      buttonName: "Submit",
                      onPressed: () {
                        onSubmit();
                      },
                      height: 40,
                      width: width * 0.4,
                      color: kbgbutton2)
                ],
              ));
        },
      ),
    );
  }
}
