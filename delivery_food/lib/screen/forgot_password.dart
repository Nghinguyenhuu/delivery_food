


import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/screen/reset_password.dart';
import 'package:delivery_food/widget/signup_process.dart';
import 'package:flutter/material.dart';

import '../constans/app_stype.dart';


class ForgotPassword extends StatelessWidget {
  final String sms;
  final  String email ;
  const ForgotPassword({Key? key, required this.sms, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SignupProcess(
            title: 'Forgot password?',
            subtile:
                'Select which contact details should we use to reset your password',
            buttontext: 'Next',
            onPress: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const ResetPassword()));
            },
            child: 
              Column(
                children: [
                  ReusableCard(
                    cardChild: ListTile(
                      leading: Image.asset('assets/images/Email.png'),
                      title: Text('Via sms:',style: kHintInputStyle,),
                      subtitle: Text(changeObscureSMS(sms),style: kSubTitleStyle,),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  ReusableCard(
                    cardChild: ListTile(
                      leading: Image.asset('assets/images/Message.png'),
                      title: Text('Via sms:',style: kHintInputStyle,),
                      subtitle: Text(changeObscureEmail(email),style: kSubTitleStyle,),
                    ),
                  ),
                ],
              )
            ),
            );
  }
  String changeObscureSMS(String sms){
    String obssms = '';
    for (int i = 0; i < sms.length; i++) {

      if( i % 4 == 0 ) {
        obssms = '$obssms ';
      }
      if (i < sms.length - 4) {
        obssms='$obssms•';
      }else{
        obssms = '$obssms${sms[i]}';
      }
    }
    return obssms;
  }
  String changeObscureEmail(String email){
    String obsemail = '';
    bool isObscure = true;
    for (var i = 0; i < email.length; i++) {
      if(email[i] == '@'){
        isObscure = false;
        obsemail = '$obsemail ';
      }
      if(isObscure){
        obsemail = '$obsemail•';

      }else{
        obsemail = obsemail + email[i];
      }
    }
    return obsemail;
  }
}
