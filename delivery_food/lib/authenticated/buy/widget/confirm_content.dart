import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/constans/app_colors.dart';
import 'package:delivery_food/constans/app_stype.dart';
import 'package:flutter/material.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart';

class ConfirmContent extends StatelessWidget {
  const ConfirmContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReusableCard(cardChild: 
          Column(
            children: [
              Row(
                children: [
                  Text('Delivery To',style: kHintInputStyle,),
                  TextButton(onPressed: (){}, child: GradientText('Edit', colors:const [AppColors.appLinerColorStart,AppColors.appLinerColorEnd]))
                ],
              )
            ],
          )
        )
      ],
    );
  }
}