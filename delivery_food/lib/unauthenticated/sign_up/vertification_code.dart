import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/components/vertify_content.dart';
import 'package:delivery_food/unauthenticated/sign_in/reset_password.dart';
import 'package:delivery_food/widget/signup_process.dart';
import 'package:flutter/material.dart';



class VertificationCode extends StatelessWidget {
  final String id;
  final String phonenumber;
  const VertificationCode({Key? key, required this.id, required this.phonenumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignupProcess(
        isskip: false,
          title: 'Enter 4-digit Verification code',
          subtile:
              'Code send to $phonenumber . This code will expired in 01:30',
          buttontext: 'Next',
          onPress: () {
            Navigator.push(context, MaterialPageRoute(builder: ((context) => ResetPassword(id:id,) )));
          },
          skipButton: () {},
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
