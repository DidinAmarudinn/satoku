import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_pet/constants/app_constants.dart';
import 'package:happy_pet/constants/assets_path.dart';
import 'package:happy_pet/services/google_signin_provider.dart';
import 'package:happy_pet/ui/components/custom_button.dart';
import 'package:happy_pet/ui/components/custom_textfield.dart';
import 'package:happy_pet/ui/screens/home/main_screen.dart';
import 'package:happy_pet/ui/widgets/bottom_dialog_selectuser.dart';
import 'package:provider/provider.dart';

class WellcomeScreen extends StatefulWidget {
  const WellcomeScreen({Key? key}) : super(key: key);

  @override
  _WellcomeScreenState createState() => _WellcomeScreenState();
}

class _WellcomeScreenState extends State<WellcomeScreen> {
  var _tEmail = TextEditingController();
  int roleSelected = 1;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GoogleSignInProvider>(context);
    double width = MediaQuery.of(context).size.width;
    Future<void> showBottomSheetRoleSelect() async {
      showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(8),
            ),
          ),
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setModalstate) =>
                  BottomDialogSelectUser(
                ontap: (index) {
                  setState(() {
                    roleSelected = index;
                  });
                  setModalstate(() {
                    roleSelected = index;
                  });
                },
                selectedIndex: roleSelected,
              ),
            );
          });
    }

    return Scaffold(
        backgroundColor: kbackgroundColor1,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(defaultMargin),
                child: Row(
                  children: [
                    Text("Wellcome Back ",
                        style: primaryTextStyle.copyWith(fontWeight: semiBold)),
                    Expanded(
                      child: Text(
                        provider.googleSignin.currentUser != null
                            ? (provider.googleSignin.currentUser!.displayName ??
                                "")
                            : "Mr. Nizar Marifat",
                        style: greenTextStyle.copyWith(
                            fontSize: 20, fontWeight: semiBold),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(kiconLogo, width: 150),
                    ),
                    SizedBox(height: defaultMargin / 2),
                    Text("Login as:", style: primaryTextStyle),
                    SizedBox(height: defaultMargin / 2),
                    GestureDetector(
                      onTap: () {
                        showBottomSheetRoleSelect();
                      },
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                width: 1,
                                color: kprimarytextColor.withOpacity(0.2),
                                style: BorderStyle.solid)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.cabin,
                              color: kbackgroundColor1,
                            ),
                            Text(roleSelected == 0 ? "User" : "Seller",
                                style: secondaryTextStyle),
                            Icon(Icons.arrow_drop_down,
                                color: kprimarytextColor, size: 24),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: defaultMargin),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: CustomButtonWidget(
                          buttonName: "Next",
                          onPressed: () {
                            Get.to(() => MainScreen());
                          },
                          height: 50,
                          width: width,
                          isBlack: false,
                          color: kbgbutton2),
                    ),
                    SizedBox(height: defaultMargin),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
