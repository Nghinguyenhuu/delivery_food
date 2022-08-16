import 'package:delivery_food/authenticated/buy/widget/trailing_buy_item.dart';
import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/constans/app_colors.dart';
import 'package:delivery_food/constans/app_stype.dart';
import 'package:delivery_food/widget/leading_button.dart';
import 'package:delivery_food/widget/pattern.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Buy extends StatelessWidget {
  const Buy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: SafeArea(
            child: Pattern(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            LeadingButton(onPress: () {}),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Order details',
                style: kHeadingStyle,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ReusableCard(
                      cardChild: ListTile(
                    leading: Image.asset(
                      'assets/images/MenuPhoto.png',
                      width: 62,
                      height: 62,
                    ),
                    title: const Text(
                      'Spacy fresh crab',
                      style: kSubTitleStyle,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Waroenk kita',
                          style: kHintInputStyle,
                        ),
                        const SizedBox(height: 10,),
                        GradientText('\$ 35', colors:const [AppColors.appLinerColorStart,AppColors.appLinerColorEnd],style: const TextStyle(
                                        fontFamily: 'BentonSans Bold',
                                        fontSize: 18),)
                      ],
                    ),
                    trailing: const TrailingBuyItem()
                  )
                  )
                  ;
                },
                itemCount: 3,
              ),
            )
          ],
        ))));
  }
}
