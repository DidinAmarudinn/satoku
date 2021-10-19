import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_pet/constants/app_constants.dart';
import 'package:happy_pet/constants/assets_path.dart';
import 'package:happy_pet/ui/components/custom_button.dart';
import 'package:happy_pet/ui/components/custom_textfield.dart';
import 'package:happy_pet/ui/screens/home/main_screen.dart';
import 'package:happy_pet/ui/screens/register_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  var _tEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kbackgroundColor1,
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "New member?",
            style: primaryTextStyle,
          ),
          TextButton(
            child: Text(
              "Sign Up",
              style: greenTextStyle,
            ),
            onPressed: () {
              Get.to(() => RegisterScreen());
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: defaultMargin),
            Text(
              "Wellcome",
              style: primaryTextStyle.copyWith(fontWeight: semiBold),
            ),
            Spacer(),
            Image.asset(kiconLogo, width: 150),
            SizedBox(
              height: defaultMargin * 2,
            ),
            Column(
              children: [
                CustomTextField(
                    label: "Username/Email",
                    controller: _tEmail,
                    isCenter: true),
                SizedBox(height: defaultMargin),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: CustomButtonWidget(
                      buttonName: "Change",
                      onPressed: () {},
                      height: 50,
                      width: width,
                      isBlack: false,
                      color: kbgbutton2),
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: CustomButtonWidget(
                buttonName: "Sign in with Gmail",
                onPressed: () {},
                height: 50,
                width: width,
                color: kbgbutton3,
                isBlack: true,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
