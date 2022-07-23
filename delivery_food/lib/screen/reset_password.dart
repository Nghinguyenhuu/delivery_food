import 'package:delivery_food/components/input_content.dart';
import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/widget/signup_process.dart';
import 'package:flutter/material.dart';


class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignupProcess(
          title: 'Reset your password here',
          subtile:
              'Select which contact details should we use to reset your password',
          buttontext: 'Next',
          onPress: () {},
          child: Form(
              child: Column(
            children:const [
              ReusableCard(cardChild: Padding(
                padding: EdgeInsets.all(8.0),
                child: InputContent(label: 'New Password',isPassword: true,),
              )),
              ReusableCard(cardChild: Padding(
                padding: EdgeInsets.all(8.0),
                child: InputContent(label: 'Reset Password',isPassword: true,),
              ))
            ],
          ))),
    );
  }
}
