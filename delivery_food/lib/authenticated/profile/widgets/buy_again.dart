import 'package:delivery_food/components/linear_decoration.dart';

import 'package:flutter/material.dart';


class BuyAgain extends StatelessWidget {
  final Function() onPressed;
  const BuyAgain({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: appLinearColor(),
        borderRadius: BorderRadius.circular(20)
      ),
      child:const Padding(
        padding: EdgeInsets.all(10.0),
        child: Text('Buy Again',style:TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16,fontFamily: 'BentonSans Medium')),
      ),
    ) ;
  }
}