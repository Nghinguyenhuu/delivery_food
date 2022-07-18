import 'package:delivery_food/constans/app_colors.dart';

import 'package:flutter/material.dart';


class LeadingButton extends StatelessWidget {
  final Function() onPress;
  const LeadingButton({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:const Color(0xFFF9A84D).withOpacity(0.1),
        borderRadius: BorderRadius.circular(15.0)
      ),
      height: 45,
      width: 45,
      child: IconButton(onPressed:onPress, icon:const Icon(Icons.arrow_back,color: AppColors.orange,)),
    ) ;
  }
}