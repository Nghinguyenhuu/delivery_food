import 'package:delivery_food/components/payment_content.dart';
import 'package:delivery_food/routes/fade_route.dart';




import 'package:delivery_food/widget/signup_process.dart';
import 'package:flutter/material.dart';

import 'upload_photo.dart';

class PaymentMethod extends StatelessWidget {
  final String id;
  const PaymentMethod({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body:  SignupProcess(
              title: 'Payment Method',
              subtile:
                  'This data will be displayed in your account profile for security',
              buttontext: 'Next',
              onPress: () {Navigator.push(context, CustomPageRoute(child: UploadPhoto(id: id,)));},
              skipButton: () { Navigator.push(context, CustomPageRoute(child: UploadPhoto(id: id,) )); },
              child: Column(children: [
                PaymentContent(onTap: () {}, asset: 'assets/images/paypal.png'),
                PaymentContent(onTap: () {}, asset: 'assets/images/visa.png'),
                PaymentContent(onTap: () {}, asset: 'assets/images/payoneer.png')
              ])),
        );
  }
}
