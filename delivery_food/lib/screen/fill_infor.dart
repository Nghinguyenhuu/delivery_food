import 'package:delivery_food/components/form_fill.dart';

import 'package:delivery_food/widget/signup_process.dart';
import 'package:flutter/material.dart';

class FillInfor extends StatelessWidget {
  const FillInfor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: SafeArea(
          child: SignupProcess(
            title: 'Fill in your bio to get started',
            subtile:
                'This data will be displayed in your account profile for security',
            buttontext: 'Next',
            onPress: () {  },
            child:const FormFill(),

          ),
        ));
  }
}
