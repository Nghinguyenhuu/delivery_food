import 'package:delivery_food/widget/pattern.dart';
import 'package:flutter/material.dart';


import '../constans/app_stype.dart';
import 'cta_button.dart';
import 'leading_button.dart';

class SignupProcess extends StatelessWidget {
  final String title;
  final String subtile;
  final Widget child; 
  final String buttontext;
  final Function() onPress;
  const SignupProcess({Key? key, required this.title, required this.subtile, required this.child, required this.buttontext, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pattern(
          child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 20),
                child: SizedBox(
                    width: 45,
                    child: LeadingButton(onPress: () {
                      Navigator.pop(context);
                    })),
              ),
               Text(
                title,
                style: kTitleStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                subtile,
                style: kTextSubTitle,
              ),
              const SizedBox(
                height: 20,
              ),
              child,           
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CTAButton(onTap:onPress, label: buttontext),
            ),
          )
        ],
      ));
  }
}