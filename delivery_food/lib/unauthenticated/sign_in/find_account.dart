import 'package:delivery_food/components/app_alert_dialog.dart';
import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/constans/app_stype.dart';
import 'package:delivery_food/data/model/user.dart';
import 'package:delivery_food/routes/fade_route.dart';
import 'package:delivery_food/unauthenticated/sign_in/forgot_password.dart';
import 'package:delivery_food/widget/cta_button.dart';
import 'package:delivery_food/widget/leading_button.dart';
import 'package:delivery_food/widget/pattern.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/user_provider.dart';

class FindAccount extends StatelessWidget {
  const FindAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    TextEditingController usercontroller = TextEditingController();
    Future<User> buildFindUser(String username) async {

      User user = await userProvider.getUserByName(username);
      return user;
    }

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Pattern(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LeadingButton(onPress: () {
                Navigator.pop(context);
              }),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Forgot Your Password',
                  style: kTitleStyle,
                ),
              ),
              const Text(
                'Please enter your username to search for your account.',
                style: kTextSubTitle,
              ),
              const SizedBox(
                height: 20,
              ),
              ReusableCard(
                  cardChild: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: usercontroller,
                  decoration: const InputDecoration(
                      hintText: 'Enter your username',
                      border: InputBorder.none),
                ),
              ))
            ],
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: CTAButton(
                  onTap: () {
                    buildFindUser(usercontroller.text).then((value) {
                      if (value.username != null) {
                        Navigator.push(
                            context,
                            CustomPageRoute(
                                child: ForgotPassword(
                              id: value.id!,
                              email: value.email!,
                              sms: value.mobilephone!,
                            )));
                      }else{
                        showDialog(context: context, builder: (context)=>const AppAlert(title: 'Error', subtile: 'account does not exist'));
                      }
                    });
                  },
                  label: 'Next'),
            ),
          )
        ],
      )),
    );
  }
}
