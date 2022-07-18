import 'package:delivery_food/components/form_login.dart';
import 'package:delivery_food/components/input_content.dart';
import 'package:delivery_food/components/login_with.dart';
import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/constans/app_colors.dart';
import 'package:delivery_food/constans/app_stype.dart';
import 'package:delivery_food/screen/signup_screen.dart';
import 'package:delivery_food/widget/cta_button.dart';
import 'package:delivery_food/widget/logo.dart';
import 'package:delivery_food/widget/pattern.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

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
        body: Pattern(
          child: Stack(children: [
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.all(20.0),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                    },
                    label: 'Login'),
              ),
            )
          ]),
        ));
  }
}
