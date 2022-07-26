import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/components/vertify_content.dart';
import 'package:delivery_food/widget/signup_process.dart';
import 'package:flutter/material.dart';

import 'forgot_password.dart';

class VertificationCode extends StatelessWidget {
  const VertificationCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignupProcess(
          title: 'Enter 4-digit Verification code',
          subtile:
              'Code send to +84774111**** . This code will expired in 01:30',
          buttontext: 'Next',
          onPress: () {
            Navigator.push(context, MaterialPageRoute(builder: ((context) =>const ForgotPassword(sms: '01212541078', email: 'hunh2880@gmail.com') )));
          },
          child: Stack(
            children: [
              ReusableCard(
                  cardChild: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      VertifyContent(),
                      VertifyContent(),
                      VertifyContent(),
                      VertifyContent(),
                    ],
                  ),
                ),
              )),
            ],
          )),
    );
  }
}
