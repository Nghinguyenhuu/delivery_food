import 'package:delivery_food/components/form_login.dart';

import 'package:delivery_food/components/login_with.dart';
import 'package:delivery_food/routes/route.dart';



import 'package:delivery_food/widget/cta_button.dart';
import 'package:delivery_food/widget/logo.dart';
import 'package:delivery_food/widget/pattern.dart';
import 'package:flutter/material.dart';

import '../../authenticated/screens/home_screen.dart';





class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Pattern(
            child: Stack(children: [
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Logo(),
                  ),
                  FormLogin(),
                  ContinueWith(),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: CTAButton(
                      onTap: () {
                        Navigator.pushNamed(context,RouteGenerator.home );
                      },
                      label: 'Login'),
                ),
              )
            ]),
          ),
        ));
  }
}
