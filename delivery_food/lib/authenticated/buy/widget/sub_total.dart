
import 'package:flutter/material.dart';


class Subtotal extends StatelessWidget {
  final String label;
  final int cost;
  final double? size;
  const Subtotal({Key? key, required this.label, required this.cost,  this.size = 16}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,style:TextStyle(fontFamily: 'BentonSans Medium',fontWeight:size == 16 ? FontWeight.w400: FontWeight.bold,fontSize: size,color: Colors.white),),
        Text('$cost \$',style: TextStyle(fontFamily: 'BentonSans Medium',fontSize: size,fontWeight:size == 16 ? FontWeight.w400: FontWeight.bold,color: Colors.white),)
      ],
    );
  }
}