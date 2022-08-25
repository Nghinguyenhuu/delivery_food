import 'package:delivery_food/components/location.dart';
import 'package:delivery_food/routes/fade_route.dart';



import 'package:delivery_food/widget/signup_process.dart';
import 'package:flutter/material.dart';

import 'vertification_code.dart';


class SetLocation extends StatefulWidget {
  final String id;
  const SetLocation({Key? key, required this.id}) : super(key: key);

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
          onPress: () {Navigator.push(context, CustomPageRoute(child: VertificationCode(id: widget.id,)));},
          skipButton: () { Navigator.push(context, CustomPageRoute(child: VertificationCode(id: widget.id,)));},
          child: Location(onPress: (){},)),
    );
  }
}
