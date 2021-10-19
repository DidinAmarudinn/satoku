import 'package:flutter/material.dart';
import 'package:happy_pet/constants/app_constants.dart';
import 'package:happy_pet/models/categories_model.dart';
import 'package:happy_pet/models/doctor_model.dart';
import 'package:happy_pet/models/header_model.dart';
import 'package:happy_pet/ui/widgets/daily_news.dart';
import 'package:happy_pet/ui/widgets/header_home.dart';
import 'package:happy_pet/ui/widgets/top_categories.dart';
import 'package:happy_pet/ui/widgets/top_doctors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor2,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: defaultMargin,
            ),
            HeaderHome(
              headerModel: mockHeader,
            ),
            SizedBox(
              height: defaultMargin,
            ),
            TopDoctorsWidget(
              doctorModel: mockDoctorModel,
            ),
            SizedBox(
              height: defaultMargin,
            ),
            TopCategories(categories: mockKategories),
            SizedBox(
              height: defaultMargin,
            ),
            DailyNews(),
          ],
        ),
      ),
    );
  }
}
