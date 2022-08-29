import 'package:delivery_food/constans/app_colors.dart';
import 'package:delivery_food/constans/app_stype.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class HomeBottomItem extends StatelessWidget {
  final String assetImage;
  final String label;
  final Function()? onPress;

  const HomeBottomItem({Key? key, required this.assetImage, required this.label, this.onPress,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap:onPress,
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: AppColors.lightgreen
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(assetImage),
              Text(label,style: kSubTitleStyle,)
            ],
          ),
        ),
      ),
    );
  }
}
