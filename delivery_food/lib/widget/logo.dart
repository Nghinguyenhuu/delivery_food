import 'package:delivery_food/constans/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/Logo.png',
          width: 175,
          height: 140,
        ),
        GradientText(
          'FoodNinja'
          , 
          style:const TextStyle(fontSize: 40, fontWeight:FontWeight.w400,fontFamily: 'Viga' ),
          colors: const [
            AppColors.appLinerColorStart,
              AppColors.appLinerColorEnd
          ]),
        const Text(
          'Deliever Favorite Food',
          style: TextStyle(
            color: AppColors.appPrimarycolor,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            fontSize: 13,
            letterSpacing: 1,
          ),
        )
      ],
    );
  }
}
