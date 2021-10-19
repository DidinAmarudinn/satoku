import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_pet/constants/app_constants.dart';
import 'package:happy_pet/constants/assets_path.dart';
import 'package:happy_pet/services/google_signin_provider.dart';
import 'package:happy_pet/ui/components/custom_button.dart';
import 'package:happy_pet/ui/components/custom_textfield.dart';
import 'package:happy_pet/ui/screens/forgot_password_screen.dart';
import 'package:happy_pet/ui/screens/home/main_screen.dart';
import 'package:happy_pet/ui/screens/register_screen.dart';
import 'package:happy_pet/ui/screens/wellcome_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _tFullname = TextEditingController();
  var _tEmail = TextEditingController();
  var _tPassword = TextEditingController();
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
            Center(
              child: Image.asset(kiconLogo, width: 150),
            ),
            SizedBox(
              height: defaultMargin * 2,
            ),
            Column(
              children: [
                CustomTextField(
                    label: "Username", controller: _tFullname, isCenter: true),
                SizedBox(
                  height: defaultMargin / 2,
                ),
                CustomTextField(
                    label: "Password", controller: _tPassword, isCenter: true),
                SizedBox(height: defaultMargin),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: CustomButtonWidget(
                      buttonName: "Login",
                      onPressed: () {
                        Get.to(() => WellcomeScreen());
                      },
                      height: 50,
                      width: width,
                      isBlack: false,
                      color: kbgbutton2),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => ForgotPasswordScreen());
                  },
                  child: Text(
                    "Forgot Password ?",
                    style: greenTextStyle,
                  ),
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: CustomButtonWidget(
                buttonName: "Sign in with Gmail",
                onPressed: () {
                  final googleProvider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  googleProvider.googleLogin();
                  if (googleProvider.googleSignin.currentUser != null) {
                    Get.offAll(() => WellcomeScreen());
                  }
                },
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
