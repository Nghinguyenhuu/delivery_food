import 'package:delivery_food/authenticated/home/home.dart';
import 'package:delivery_food/authenticated/home/home_screen.dart';
import 'package:delivery_food/components/app_alert_dialog.dart';
import 'package:delivery_food/components/input_content.dart';
import 'package:delivery_food/components/login_with.dart';
import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/constans/app_colors.dart';
import 'package:delivery_food/constans/app_stype.dart';
import 'package:delivery_food/data/model/user.dart';
import 'package:delivery_food/provider/user_provider.dart';
import 'package:delivery_food/routes/fade_route.dart';
import 'package:delivery_food/routes/route.dart';
import 'package:delivery_food/unauthenticated/sign_in/find_account.dart';
import 'package:delivery_food/widget/cta_button.dart';
import 'package:delivery_food/widget/logo.dart';
import 'package:delivery_food/widget/pattern.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

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
      if (await userProvider.checkUser(user, password)) {
         await userProvider.getUserByName(user).then((value) => Navigator.push(context, CustomPageRoute(child: HomeScreen(users: value))));
        
      } else {
        showDialog(
            context: context,
            builder: (context) => const AppAlert(
                title: 'Error', subtile: 'Username or Password not correct!'));
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
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              CustomPageRoute(child: const FindAccount()));
                        },
                        child: GradientText('Forgot Your Password',
                            style: kMidiumStyle,
                            colors: const [
                              AppColors.appLinerColorStart,
                              AppColors.appLinerColorEnd
                            ]),
                      ),
                    ),
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
