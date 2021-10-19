import 'package:flutter/material.dart';
import 'package:happy_pet/constants/app_constants.dart';
import 'package:happy_pet/models/categories_model.dart';
import 'package:happy_pet/ui/components/card_categories.dart';

class TopCategories extends StatelessWidget {
  final List<CategoriesModel> categories;
  const TopCategories({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Text(
            "Top Categories",
            style:
                primaryTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: defaultMargin / 2),
          height: 80,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final data = categories[index];
              return Padding(
                padding: index == 0
                    ? EdgeInsets.only(
                        left: defaultMargin, right: defaultMargin / 2)
                    : EdgeInsets.only(right: defaultMargin / 2),
                child: CardCategories(data: data),
              );
            },
          ),
        )
      ]),
    );
  }
}
