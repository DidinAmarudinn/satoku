import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_pet/constants/app_constants.dart';
import 'package:happy_pet/constants/assets_path.dart';
import 'package:happy_pet/ui/components/custom_button.dart';
import 'package:happy_pet/ui/screens/login_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  Widget _buildImage(String assetName, double width, double height, bool isLeft,
      bool isCenter) {
    return Container(
        width: width,
        alignment: isLeft
            ? Alignment.centerLeft
            : isCenter
                ? Alignment.center
                : Alignment.centerRight,
        height: height * 0.7,
        child: Image.asset(
          'assets/$assetName',
          width: 300,
          fit: BoxFit.cover,
        ));
  }

  void _onIntroEnd(context) {
    Get.to(() => LoginScreen());
  }

  PageDecoration pageDecoration = PageDecoration(
    titleTextStyle: primaryTextStyle.copyWith(
      fontSize: 16,
      fontWeight: semiBold,
    ),
    bodyTextStyle: subtitleTextStyle,
    titlePadding: EdgeInsets.only(bottom: 12, top: defaultMargin),
    contentMargin: EdgeInsets.all(12),
    imageFlex: 4,
    bodyFlex: 2,
    descriptionPadding: EdgeInsets.all(defaultMargin / 2),
    imagePadding: EdgeInsets.only(bottom: defaultMargin),
    pageColor: kbackgroundColor1,
  );

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<PageViewModel> listOnBoard = [
      PageViewModel(
          title: "Manage Your health",
          image: _buildImage(kimageIntroduction1, width, height, true, false),
          body:
              "Manage your health online and get assistance on how to improve your health online with no human interaction.",
          decoration: pageDecoration),
      PageViewModel(
          title: "Book / Schedule your Appointments",
          image: _buildImage(kimageIntroduction2, width, height, false, false),
          body:
              "Want to book an appointment? No need to go anywhere, book and manage your appointments while seating at home.",
          decoration: pageDecoration),
      PageViewModel(
          title: "Join Community",
          image: _buildImage(kimageIntroduction3, width, height, false, true),
          body: "Join and make an impact for the happiness of the animals",
          decoration: pageDecoration),
    ];

    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          key: introKey,
          globalBackgroundColor: kbackgroundColor1,
          pages: listOnBoard,
          dotsDecorator: DotsDecorator(
            size: Size(10.0, 10.0),
            color: Colors.white,
            activeSize: Size(22.0, 10.0),
            activeColor: kbgbutton1,
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
          onDone: () => _onIntroEnd(context),
          showSkipButton: true,
          skipFlex: 0,
          curve: Curves.bounceInOut,
          nextFlex: 0,
          skip: Text(
            'Skip',
            style:
                primaryTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          next: Icon(
            Icons.chevron_right,
            color: kbgbutton3,
            size: 25,
          ),
          done: CustomButtonWidget(
            buttonName: "Done",
            isBlack: true,
            onPressed: () {
              _onIntroEnd(context);
            },
            height: 50,
            width: 150,
            color: kbgbutton3,
          ),
        ),
      ),
    );
  }
}
