import 'package:flutter/material.dart';
import 'package:happy_pet/constants/app_constants.dart';
import 'package:happy_pet/models/categories_model.dart';
import 'package:happy_pet/models/header_model.dart';

class CardCategories extends StatelessWidget {
  final CategoriesModel data;
  const CardCategories({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kcategoriesColor.withOpacity(0.5),
      ),
      child: Center(
        child: Text(
          data.nameKategories,
          style: whiteTextStyle.copyWith(fontWeight: medium),
        ),
      ),
    );
  }
}
