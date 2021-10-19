import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_pet/constants/app_constants.dart';
import 'package:happy_pet/ui/components/custom_button.dart';
import 'package:happy_pet/ui/screens/home/main_screen.dart';

class DialogThankyou extends StatelessWidget {
  const DialogThankyou({Key? key}) : super(key: key);

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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Thank You !",
                      style: greenTextStyle.copyWith(
                          fontSize: 28,
                          fontWeight: semiBold,
                          color: kbgbutton2)),
                  Container(
                      height: height * 0.2,
                      width: height * 0.2,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kbgbutton2,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: height * 0.15,
                        ),
                      )),
                  CustomButtonWidget(
                      buttonName: "Back to Home",
                      onPressed: () {
                        Get.offAll(() => MainScreen());
                      },
                      height: 40,
                      width: width * 0.5,
                      color: kbgbutton2),
                ],
              ));
        },
      ),
    );
  }
}
