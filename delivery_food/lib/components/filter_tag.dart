import 'package:delivery_food/components/reusable_home_card.dart';
import 'package:delivery_food/constans/app_colors.dart';
import 'package:flutter/material.dart';

class FilterTag extends StatelessWidget {
  final String tagName;
  const FilterTag({Key? key, required this.tagName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReusableHomeCard(
        child: TextButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 12),
              child: Text(
                tagName,
                style: const TextStyle(
                    fontFamily: 'BentonSans Bold',
                    fontWeight: FontWeight.w100,
                    fontSize: 14,
                    
                    letterSpacing: 0.7,
                    color: AppColors.orange),
              ),
            )));
  }
}
