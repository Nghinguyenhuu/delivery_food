

import 'package:delivery_food/components/custom_checkbox.dart';
import 'package:delivery_food/components/input_content.dart';

import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/constans/app_colors.dart';
import 'package:delivery_food/constans/app_stype.dart';
import 'package:delivery_food/data/data_source/user_data.dart';
import 'package:delivery_food/data/model/user.dart';
import 'package:delivery_food/unauthenticated/sign_in/login_page.dart';

import 'package:delivery_food/widget/cta_button.dart';
import 'package:delivery_food/widget/logo.dart';
import 'package:delivery_food/widget/pattern.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpScreen> {
  final usercontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Pattern(
          child: Stack(children: [
            Column(
              children: [
                const Logo(),
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  'Sign Up Your For Free',
                  style: kHeadingStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableCard(
                        cardChild: InputContent(
                      myController: usercontroller,
                      icon: Image.asset(
                        'assets/icons/Profile.png',
                        width: 24,
                      ),
                      label: 'Username',
                    )),
                    ReusableCard(
                        cardChild: InputContent(
                      myController: emailcontroller,
                      icon: Image.asset(
                        'assets/icons/Message.png',
                        width: 24,
                      ),
                      label: 'Email',
                    )),
                    ReusableCard(
                        cardChild: InputContent(
                      myController: passwordcontroller,
                      icon: Image.asset(
                        'assets/icons/Lock.png',
                        width: 24,
                      ),
                      label: 'Password',
                      isPassword: true,
                    )),
                  ],
                )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const CustomCheckbox(),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        'Keep Me Signed In',
                        style: kCheckboxStyle,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  children: [
                    const CustomCheckbox(),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        'Email Me About Special Pricing',
                        style: kCheckboxStyle,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        ReusableCard(
                            cardChild: CTAButton(
                                onTap: () {
                                  buildCreateAccount(
                                      usercontroller.text,
                                      passwordcontroller.text,
                                      emailcontroller.text)
                                      ? Navigator.push(context,MaterialPageRoute(builder: (context)=> const LoginPage()))
                                      : showDialog(context: context, builder:(context) =>const AlertDialog(
                                        content: Text('Username, Password or Email is empty'),
                                      ));              
                                },
                                label: 'Create Account')),
                        const SizedBox(
                          height: 14,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ));
                          },
                          child: GradientText('Already have an account',
                              style: kMidiumStyle,
                              colors: const [
                                AppColors.appLinerColorStart,
                                AppColors.appLinerColorEnd
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  bool buildCreateAccount(String pass, String username, String email) {
    if(pass != "" && username != "" && email!=""){
      User user = User(password: pass, username: username, email: email);

      UserData().addUser(user);
      return true;
    }
    return false;
}
}