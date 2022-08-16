import 'package:delivery_food/components/input_content.dart';
import 'package:delivery_food/components/login_with.dart';
import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/constans/app_stype.dart';
import 'package:delivery_food/data/data_source/list_data_user_default.dart';
import 'package:delivery_food/data/model/user.dart';
import 'package:delivery_food/routes/route.dart';
import 'package:delivery_food/widget/cta_button.dart';
import 'package:delivery_food/widget/logo.dart';
import 'package:delivery_food/widget/pattern.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Pattern(
            child: Stack(children: [
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Logo(),
                  ),
                  Form(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            'Login To Your Account',
                            style: kHeadingStyle,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ReusableCard(
                            cardChild: InputContent(
                          label: 'Email',
                          myController: emailcontroller,
                        )),
                        ReusableCard(
                            cardChild: InputContent(
                          label: 'Password',
                          isPassword: true,
                          myController: passwordcontroller,
                        )),
                      ],
                    ),
                  ),
                  const ContinueWith(),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: CTAButton(
                      onTap: () {
                        buildLogin(
                            emailcontroller.text, passwordcontroller.text);
                      },
                      label: 'Login'),
                ),
              )
            ]),
          ),
        ));
  }

  Future buildLogin(String user, String password) async {
    if (listUSer.any((element) =>
        element.username == user && element.password == password)) {
      User userAuth = listUSer.firstWhere((element) =>
          element.username == user && element.password == password);
      Navigator.pushNamed(context, RouteGenerator.home, arguments: userAuth);
    }
  }
}
