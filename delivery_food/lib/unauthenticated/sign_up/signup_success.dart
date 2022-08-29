import 'package:delivery_food/routes/fade_route.dart';
import 'package:delivery_food/unauthenticated/sign_in/login_page.dart';
import 'package:delivery_food/widget/pattern.dart';
import 'package:delivery_food/widget/success_notification.dart';
import 'package:flutter/material.dart';


class SignupSuccess extends StatelessWidget {
  const SignupSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
      body:Pattern(child: SuccessNotification(label: 'Your Profile Is Ready To Use',buttontext: 'Try Oder',onPress: (){Navigator.push(context,CustomPageRoute(child: const LoginPage()));},),
    )) ;
  }
}