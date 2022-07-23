import 'package:delivery_food/components/location.dart';

import 'package:delivery_food/screen/vertification_code.dart';

import 'package:delivery_food/widget/signup_process.dart';
import 'package:flutter/material.dart';


class SetLocation extends StatefulWidget {
  const SetLocation({Key? key}) : super(key: key);

  @override
  State<SetLocation> createState() => _SetLocationState();
}

class _SetLocationState extends State<SetLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignupProcess(
          title: 'Set Your Location ',
          subtile:
              'This data will be displayed in your account profile for security',
          buttontext: 'Next',
          onPress: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> const VertificationCode()));},
          child: Location(onPress: (){},)),
    );
  }
}
