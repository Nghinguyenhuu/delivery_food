import 'package:delivery_food/components/input_content.dart';
import 'package:delivery_food/components/login_with.dart';
import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/constans/app_stype.dart';
import 'package:delivery_food/data/data_source/list_data_user_default.dart';
import 'package:delivery_food/data/model/user.dart';
import 'package:delivery_food/provider/user_provider.dart';
import 'package:delivery_food/routes/route.dart';
import 'package:delivery_food/widget/cta_button.dart';
import 'package:delivery_food/widget/logo.dart';
import 'package:delivery_food/widget/pattern.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

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
    final userProvider = Provider.of<UserProvider>(context);

    _buildLogin(String user, String password) async {
      if (await userProvider.getUser(user, password)) {
        User userAuth = userProvider.user;
        Navigator.pushNamed(context, RouteGenerator.home, arguments: userAuth);
      }
    }

    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: SafeArea(
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
                    CTAButton(
                        onTap: () {
                          _buildLogin(
                              emailcontroller.text, passwordcontroller.text);
                        },
                        label: 'Login'),
                  ],
                ),
              ]),
            ),
          ),
        ));
  }
}
