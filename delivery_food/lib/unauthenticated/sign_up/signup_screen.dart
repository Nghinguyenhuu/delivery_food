import 'package:delivery_food/components/app_alert_dialog.dart';
import 'package:delivery_food/components/custom_checkbox.dart';
import 'package:delivery_food/components/input_content.dart';
import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/constans/app_colors.dart';
import 'package:delivery_food/constans/app_stype.dart';
import 'package:delivery_food/data/model/user.dart';
import 'package:delivery_food/routes/fade_route.dart';
import 'package:delivery_food/routes/route.dart';
import 'package:delivery_food/unauthenticated/sign_up/fill_infor.dart';
import 'package:delivery_food/widget/cta_button.dart';
import 'package:delivery_food/widget/logo.dart';
import 'package:delivery_food/widget/pattern.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../provider/user_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpScreen> {
  final usercontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  String id = '';
  @override
  void initState() {
    usercontroller.text = '';
    emailcontroller.text = '';
    passwordcontroller.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    Future<String> buildCreateAccount(
        String username, String pass, String email) async {
      if (pass != "" && username != "" && email != "") {
        if (await userProvider.checkUsernameContain(username)) {
          showDialog(
              context: context,
              builder: (context) => const AppAlert(
                  title: 'Error', subtile: 'This account has already existed'));
          initState();
          return '';
        } else {
          User user = User(username: username, password: pass, email: email);
          String id = await userProvider.addUser(user);
          print("id in signup ${id}");
          
          return id ;
        }
      }
      showDialog(
          context: context,
          builder: (context) => const AppAlert(
              title: 'Error',
              subtile: 'Please fill in all the required fields.'));
      return '';
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Pattern(
            child: Stack(children: [
              Column(
                children: [
                  const Logo(),
                  const SizedBox(
                    height: 45,
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
                                        .then((value) {
                                      Navigator.push(
                                          context,
                                          CustomPageRoute(
                                              child: FillInfor(
                                            id: value,
                                          )));
                                    });
                                  },
                                  label: 'Create Account')),
                          const SizedBox(
                            height: 14,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteGenerator.signin);
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
      ),
    );
  }
}
