import 'package:delivery_food/components/payment_content.dart';

import 'package:delivery_food/screen/upload_photo.dart';

import 'package:delivery_food/widget/signup_process.dart';
import 'package:flutter/material.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body:  SignupProcess(
              title: 'Payment Method',
              subtile:
                  'This data will be displayed in your account profile for security',
              buttontext: 'Next',
              onPress: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>const UploadPhoto()));},
              child: Column(children: [
                PaymentContent(onTap: () {}, asset: 'assets/images/paypal.png'),
                PaymentContent(onTap: () {}, asset: 'assets/images/visa.png'),
                PaymentContent(onTap: () {}, asset: 'assets/images/payoneer.png')
              ])),
        );
  }
}
