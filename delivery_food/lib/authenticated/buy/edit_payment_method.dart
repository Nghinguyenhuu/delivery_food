import 'dart:ui';

import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/constans/app_colors.dart';
import 'package:delivery_food/constans/app_stype.dart';
import 'package:delivery_food/widget/leading_button.dart';
import 'package:delivery_food/widget/pattern.dart';
import 'package:flutter/material.dart';


class EditPaymentMethod extends StatelessWidget {
  const EditPaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      Pattern(child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LeadingButton(onPress: (){Navigator.pop(context);}),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text('Payment',style: kHeadingStyle,),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.6,
              child: ListView.builder(itemBuilder: (context,index){
                return ReusableCard(cardChild:Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightgrey,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30,horizontal:20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/images/paypal.png'),
                        const Text('2121 6352 8465 ****')
                      ],
                    ),
                  ),
                )) ;
              },itemCount: 3,),
            ),
            
          ],
        )
      )),
    ); 
  }
}