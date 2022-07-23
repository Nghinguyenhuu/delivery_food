import 'package:delivery_food/widget/pattern.dart';
import 'package:delivery_food/widget/success_notification.dart';
import 'package:flutter/material.dart';


class SignupSuccess extends StatelessWidget {
  const SignupSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Pattern(child: SuccessNotification(label: 'Your Profile Is Ready To Use'),
    )) ;
  }
}