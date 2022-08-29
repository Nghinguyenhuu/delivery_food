import 'package:delivery_food/authenticated/buy/edit_payment_method.dart';
import 'package:delivery_food/authenticated/buy/widget/total.dart';
import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/constans/app_colors.dart';
import 'package:delivery_food/constans/app_stype.dart';
import 'package:delivery_food/routes/fade_route.dart';
import 'package:delivery_food/widget/leading_button.dart';
import 'package:delivery_food/widget/pattern.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ConfirmOrder extends StatefulWidget {

  final Total total;

  const ConfirmOrder({Key? key, required this.total}) : super(key: key);

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
  
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  String? asset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Pattern(
              child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LeadingButton(onPress: () {Navigator.pop(context);}),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Confirm Order',
                  style: kHeadingStyle,
                ),
              ),
              ReusableCard(
                  cardChild: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery To',
                          style: kHintInputStyle,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: GradientText('Edit', colors: const [
                              AppColors.appLinerColorStart,
                              AppColors.appLinerColorEnd
                            ]))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/images/IconLocation.png'),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: const Text(
                              '4517 Washington Ave. Manchester, Kentucky 39495',
                              style: kSubTitleStyle,
                              maxLines: 2,
                            )),
                      ],
                    )
                  ],
                ),
              )),
              ReusableCard(
                  cardChild: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Payment Method',
                          style: kHintInputStyle,
                        ),
                        TextButton(
                            onPressed: (){
                              Navigator.push(context, CustomPageRoute(child: const EditPaymentMethod()));
                            },
                            child: GradientText('Edit', colors: const [
                              AppColors.appLinerColorStart,
                              AppColors.appLinerColorEnd
                            ]))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('assets/images/${asset ?? 'visa.png'}'),
                          const Text('2121 6352 8465 ****')
                        ],
                      ),
                    )
                  ],
                ),
              )),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: widget.total,
          )
        ],
      )
      )),
    );
  }
  

}
