import 'package:delivery_food/constans/app_stype.dart';
import 'package:flutter/material.dart';

class UploadContent extends StatelessWidget {
  final String lable;
  final Function() onPress;
  final String assetImage;

  const UploadContent({Key? key, required this.lable, required this.onPress, required this.assetImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPress ,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0)
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 22,bottom: 22),
            child: Column(
              children: [
                Image.asset(assetImage),
                const SizedBox(height:10 ,),
                Text(lable,style:kSubTitleStyle,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}