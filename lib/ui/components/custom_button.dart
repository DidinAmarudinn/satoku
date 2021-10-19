import 'package:flutter/material.dart';
import 'package:happy_pet/constants/app_constants.dart';

class CustomButtonWidget extends StatelessWidget {
  final String buttonName;
  final Function onPressed;
  final double height;
  final bool? isBlack;
  final Color color;
  final double width;
  const CustomButtonWidget(
      {Key? key,
      required this.buttonName,
      required this.onPressed,
      required this.height,
      required this.width,
      required this.color,
      this.isBlack = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(height / 2),
          ),
        ),
        child: Text(
          buttonName,
          style: isBlack!
              ? primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium)
              : whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
        ),
      ),
    );
  }
}
