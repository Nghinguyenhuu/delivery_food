import 'package:delivery_food/authenticated/details/widgets/details_button.dart';
import 'package:delivery_food/constans/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 75,
            height: 35,
            decoration: BoxDecoration(
                color: AppColors.lightgreen,
                borderRadius: BorderRadius.circular(15)),
            child: const Center(
                child: Text(
              'Popular',
              style: TextStyle(
                  color: AppColors.appLinerColorEnd,
                  fontFamily: 'BentonSans Medium',
                  letterSpacing: 0.5,
                  fontSize: 14),
            )),
          ),
          Row(
            children: [
              DetailsButton(
                icon: Image.asset(
                  'assets/icons/Shape.png',
                ),
                color: AppColors.lightgreen,
              ),
              const SizedBox(
                width: 10,
              ),
              DetailsButton(
                  icon: Image.asset(
                    'assets/icons/Heart.png',
                  ),
                  color: AppColors.lightpink)
            ],
          )
        ],
      ),
    );
  }
}
