import 'package:delivery_food/constans/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SkipButton extends StatelessWidget {
  final Function() onPress;
  const SkipButton({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: 
      Container(
      decoration: BoxDecoration(
        color:const Color(0xFFF9A84D).withOpacity(0.1),
        borderRadius: BorderRadius.circular(15.0)
      ),
      height: 45,
      width: 45,
      child:const Center(child: Text('Skip',style:TextStyle(color: AppColors.orange,fontWeight: FontWeight.bold),))
    ) 
    );
  }
}