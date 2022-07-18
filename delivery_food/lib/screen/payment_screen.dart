
import 'package:delivery_food/components/payment_content.dart';
import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/constans/app_stype.dart';
import 'package:delivery_food/screen/upload_photo.dart';
import 'package:delivery_food/widget/cta_button.dart';
import 'package:delivery_food/widget/leading_button.dart';
import 'package:delivery_food/widget/pattern.dart';
import 'package:flutter/material.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Pattern(
          child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 20),
                child: SizedBox(
                    width: 45,
                    child: LeadingButton(onPress: () {
                      Navigator.pop(context);
                    })),
              ),
              const Text(
                'Payment Method',
                style: kTitleStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'This data will be displayed in your account profile for security',
                style: kSubTitleStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              ReusableCard(
                  cardChild: PaymentContent(onTap: (){}, asset:'assets/images/visa.png')),
              ReusableCard(
                  cardChild:PaymentContent(onTap: (){}, asset:'assets/images/paypal.png') ),
              ReusableCard(
                  cardChild:PaymentContent(onTap: (){}, asset:'assets/images/payoneer.png')) ,
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CTAButton(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => const UploadPhoto())));
              }, label: 'Next'),
            ),
          )
        ],
      )),
    );
  }
}
