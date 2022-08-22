import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/constans/app_colors.dart';
import 'package:delivery_food/constans/app_stype.dart';
import 'package:delivery_food/widget/leading_button.dart';
import 'package:delivery_food/widget/pattern.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ConfirmOrder extends StatelessWidget {
  const ConfirmOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Pattern(child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LeadingButton(onPress: (){}),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text('Confirm Order',style: kHeadingStyle,),

          ),
          ReusableCard(cardChild: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text('Delivery To',style: kHintInputStyle,),
                    TextButton(onPressed: (){}, child: GradientText('Edit', colors: const [AppColors.appLinerColorStart,AppColors.appLinerColorEnd]))
                  ],
                )
              ],
            ),
          ))
        ],
      ))),
    );
  }
}