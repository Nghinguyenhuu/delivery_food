import 'package:delivery_food/constans/app_stype.dart';
import 'package:flutter/material.dart';


class Nametag extends StatelessWidget {
  final String name;
  final String email;
  final Function()? onPressed;
  const Nametag({Key? key, required this.name, required this.email, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name,style: kTitleStyle,),
              IconButton(onPressed: onPressed, icon: Image.asset('assets/icons/EditIcon.png'))
            ],
          ),
          Text(email,style: kHintInputStyle,)
        ],
      ),
    ) ; 
  }
}