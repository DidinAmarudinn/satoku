import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_pet/constants/app_constants.dart';
import 'package:happy_pet/constants/assets_path.dart';
import 'package:happy_pet/ui/components/custom_button.dart';
import 'package:happy_pet/ui/components/custom_textfield.dart';
import 'package:happy_pet/ui/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var _tFullname = TextEditingController();
  var _tEmail = TextEditingController();
  var _tPassword = TextEditingController();
  bool _checkbox = false;
  var _tConfirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kbackgroundColor1,
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already a member?",
            style: primaryTextStyle,
          ),
          TextButton(
            child: Text(
              "Sign In",
              style: greenTextStyle,
            ),
            onPressed: () {
              Get.to(() => LoginScreen());
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: defaultMargin),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Image.asset(kiconLogo, width: 150),
              ),
              CustomTextField(label: "Full Name", controller: _tFullname),
              SizedBox(
                height: defaultMargin / 2,
              ),
              CustomTextField(label: "Email Address", controller: _tEmail),
              SizedBox(
                height: defaultMargin / 2,
              ),
              CustomTextField(label: "Password", controller: _tPassword),
              SizedBox(
                height: defaultMargin / 2,
              ),
              CustomTextField(
                  label: "Confirm Password", controller: _tConfirmPassword),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: defaultMargin / 2, vertical: defaultMargin / 2),
                height: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _checkbox,
                      activeColor: Colors.transparent,
                      hoverColor: kprimarytextColor,
                      checkColor: kprimarytextColor,
                      onChanged: (value) {
                        setState(() {
                          _checkbox = !_checkbox;
                        });
                      },
                    ),
                    Text(
                      "I Read and Accept the Terms and conditions",
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: defaultMargin / 2,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: CustomButtonWidget(
                    buttonName: "Sign Up",
                    onPressed: () {},
                    height: 50,
                    width: width,
                    color: kbgbutton1),
              ),
              SizedBox(
                height: defaultMargin / 2,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: CustomButtonWidget(
                  buttonName: "Sign in with Gmail",
                  onPressed: () {},
                  height: 50,
                  width: width,
                  isBlack: true,
                  color: kbgbutton3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
