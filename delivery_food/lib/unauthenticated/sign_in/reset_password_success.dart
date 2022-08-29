import 'package:delivery_food/routes/fade_route.dart';
import 'package:delivery_food/unauthenticated/sign_in/login_page.dart';
import 'package:delivery_food/widget/pattern.dart';
import 'package:delivery_food/widget/success_notification.dart';
import 'package:flutter/material.dart';

class ResetPWSuccess extends StatelessWidget {
  const ResetPWSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Pattern(
            child: SuccessNotification(
              onPress: (){Navigator.push(context, CustomPageRoute(child:const LoginPage()));},
                label: 'Password reset succesful', buttontext: 'Back')));
  }
}
