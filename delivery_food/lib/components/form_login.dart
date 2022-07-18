import 'package:flutter/cupertino.dart';
import '../constans/app_stype.dart';
import 'input_content.dart';
import 'reusable_card.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'Login To Your Account',
              style: kHeadingStyle,
            ),
          ),
          SizedBox(height: 30,),
          ReusableCard(cardChild: InputContent(label: 'Email')),
          ReusableCard(
              cardChild: InputContent(
            label: 'Password',
            isPassword: true,
          )),
        ],
      ),
    );
  }
}
