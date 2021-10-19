import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_pet/constants/app_constants.dart';
import 'package:happy_pet/models/header_model.dart';
import 'package:happy_pet/ui/components/item_header.dart';
import 'package:happy_pet/ui/components/search_bar.dart';
import 'package:happy_pet/ui/screens/list_doctor_screen.dart';

class HeaderHome extends StatelessWidget {
  final List<HeaderModel> headerModel;
  const HeaderHome({Key? key, required this.headerModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                    onTap: () {
                      Get.to(() => ListDoctorScreen());
                    },
                    child: SearchBar()),
              ),
              SizedBox(width: defaultMargin / 2),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: kbgbutton1,
                  ),
                ),
                child: Center(
                    child: Icon(
                  Icons.person,
                  color: kbgbutton1,
                )),
              )
            ],
          ),
        ),
        SizedBox(
          height: defaultMargin / 2,
        ),
        Container(
          height: 120,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: headerModel.length,
              itemBuilder: (context, index) {
                final data = headerModel[index];
                return Padding(
                  padding: index == 0
                      ? EdgeInsets.symmetric(horizontal: defaultMargin)
                      : EdgeInsets.only(right: defaultMargin),
                  child: ItemHeader(data: data),
                );
              }),
        )
      ],
    );
  }
}
