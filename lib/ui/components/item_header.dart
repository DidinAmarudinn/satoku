import 'package:flutter/material.dart';
import 'package:happy_pet/constants/app_constants.dart';
import 'package:happy_pet/models/header_model.dart';

class ItemHeader extends StatelessWidget {
  final HeaderModel data;
  const ItemHeader({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 90,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Expanded(child: Image.asset(data.imageName)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              data.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: primaryTextStyle.copyWith(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
