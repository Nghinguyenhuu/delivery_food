import 'package:delivery_food/widget/success_notification.dart';
import 'package:flutter/material.dart';


class ResetPWSuccess extends StatelessWidget {
  const ResetPWSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: SuccessNotification(label: 'Password reset succesful',buttontext: 'Back',),
    ); 
  }
}