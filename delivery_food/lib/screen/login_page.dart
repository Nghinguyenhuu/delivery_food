import 'package:delivery_food/components/input_content.dart';
import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/constans/app_colors.dart';
import 'package:delivery_food/constans/app_stype.dart';
import 'package:delivery_food/screen/signup_page.dart';
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
              children: [
                const Logo(),
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  'Login To Your Account',
                  style: kHeadingStyle,
                ),
                const SizedBox(
                  height: 40,
                ),
                const ReusableCard(cardChild: InputContent(label: 'Email')),
                const SizedBox(
                  height: 12,
                ),
                const ReusableCard(
                    cardChild: InputContent(
                  label: 'Password',
                  isPassword: true,
                )),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Or Continue With',
                    style: kSubTitleStyle,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableCard(
                        cardChild: SizedBox(
                          height: 60,
                          width: 150,
                          child: TextButton.icon(
                              onPressed: () {},
                              icon: Image.asset('assets/icons/facebook.png'),
                              label: const Text('FaceBook',style:kSubTitleStyle,)),
                        )),
                    ReusableCard(
                        cardChild: SizedBox(
                          height: 60,
                          width: 150,
                          child: TextButton.icon(
                              onPressed: () {},
                              icon: Image.asset('assets/icons/google.png'),
                              label: const Text('Google',style: kSubTitleStyle,)),
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GradientText('Forgot Your Password',style: kMidiumStyle, colors:const [AppColors.appLinerColorStart,AppColors.appLinerColorEnd]
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: CTAButton(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage() ));
                }, label: 'Login'),
              ),
            )
          ]),
        ));
  }
}
