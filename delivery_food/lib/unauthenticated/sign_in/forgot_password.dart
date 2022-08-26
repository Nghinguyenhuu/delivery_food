import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/constans/app_colors.dart';
import 'package:delivery_food/routes/fade_route.dart';
import 'package:delivery_food/unauthenticated/sign_up/vertification_code.dart';

import 'package:delivery_food/widget/signup_process.dart';
import 'package:flutter/material.dart';

import '../../constans/app_stype.dart';





class ForgotPassword extends StatelessWidget {
  final String id;
  final String sms;
  final String email;
  const ForgotPassword({Key? key, required this.sms, required this.email, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignupProcess(
        isskip: false,
          title: 'Forgot password?',
          subtile:
              'Select which contact details should we use to reset your password',
          buttontext: 'Next',
          onPress: () {
            Navigator.push(context,
                CustomPageRoute(child: VertificationCode(id:id, phonenumber:changeObscureSMS(sms), )));
          },
          skipButton: () {  },
          child: Column(
            children: [
              ReusableCard(
                cardChild: ListTile(
                  leading: Image.asset('assets/images/Email.png'),
                  title: Text(
                    'Via sms:',
                    style: kHintInputStyle,
                  ),
                  subtitle: Text(
                    changeObscureSMS(sms),
                    style: const TextStyle(
                        fontFamily: 'Bentonsans Book',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.appPrimarycolor),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ReusableCard(
                cardChild: ListTile(
                  leading: Image.asset('assets/images/Message.png'),
                  title: Text(
                    'Via sms:',
                    style: kHintInputStyle,
                  ),
                  subtitle: Text(
                    changeObscureEmail(email),
                    style: const TextStyle(
                        fontFamily: 'Bentonsans Book',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.appPrimarycolor),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  String changeObscureSMS(String sms) {
    String obssms = '';
    for (int i = 0; i < sms.length; i++) {
      if (i % 4 == 0) {
        obssms = '$obssms ';
      }
      if (i < sms.length - 4) {
        obssms = '$obssms•';
      } else {
        obssms = '$obssms${sms[i]}';
      }
    }
    return obssms;
  }

  String changeObscureEmail(String email) {
    String obsemail = '';
    bool isObscure = true;
    for (var i = 0; i < email.length; i++) {
      if (email[i] == '@') {
        isObscure = false;
        obsemail = '$obsemail ';
      }
      if (isObscure) {
        obsemail = '$obsemail•';
      } else {
        obsemail = obsemail + email[i];
      }
    }
    return obsemail;
  }
}
