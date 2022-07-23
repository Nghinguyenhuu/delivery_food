import 'package:delivery_food/widget/success_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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