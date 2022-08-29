import 'package:delivery_food/components/app_alert_dialog.dart';
import 'package:delivery_food/components/input_content.dart';
import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/data/model/user.dart';
import 'package:delivery_food/provider/user_provider.dart';
import 'package:delivery_food/routes/fade_route.dart';

import 'package:delivery_food/widget/signup_process.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'reset_password_success.dart';

class ResetPassword extends StatefulWidget {
  final String id;
  const ResetPassword({Key? key, required this.id}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    TextEditingController newpasscontroller = TextEditingController();
    TextEditingController confirmcontroller = TextEditingController();
    final userProvider = Provider.of<UserProvider>(context);
    void buildResetPW(String newpw, String confirmPW) async {
      if (newpw == confirmPW) {
        User user = await userProvider.getUser(widget.id);
        user.password = newpw;
        userProvider.updateUser(user).then((value) => Navigator.push(
            context, CustomPageRoute(child: const ResetPWSuccess())));
      } else {
        showDialog(
            context: context,
            builder: (context) => const AppAlert(
                title: 'Error',
                subtile: 'NewPW and Confirm Password not correct'));
      }
    }

    return Scaffold(
      body: SignupProcess(
          isskip: false,
          title: 'Reset your password here',
          subtile:
              'Select which contact details should we use to reset your password',
          buttontext: 'Next',
          onPress: () {
            buildResetPW(newpasscontroller.text, confirmcontroller.text);
          },
          skipButton: () {},
          child: Form(
              child: Column(
            children: [
              ReusableCard(
                  cardChild: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InputContent(
                  label: 'New Password',
                  isPassword: true,
                  myController: newpasscontroller,
                ),
              )),
              ReusableCard(
                  cardChild: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InputContent(
                  label: 'Reset Password',
                  isPassword: true,
                  myController: confirmcontroller,
                ),
              ))
            ],
          ))),
    );
  }
}
