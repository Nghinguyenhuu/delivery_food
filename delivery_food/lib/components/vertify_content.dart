import 'package:delivery_food/constans/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class VertifyContent extends StatelessWidget {
  const VertifyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      height: 64,
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }else{
            FocusScope.of(context).previousFocus();
          }
        },
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        
        style:const TextStyle(
          height: 2,
                fontSize: 33,
                fontFamily: 'BentonSans Medium',
                fontWeight: FontWeight.w400,
                color: AppColors.appPrimarycolor,),
        
        decoration: InputDecoration(
            hintText: '0',
            border: InputBorder.none,
            hintStyle: TextStyle(
              height:2,
                fontSize: 33,
                fontFamily: 'BentonSans Medium',
                fontWeight: FontWeight.w400,
                color: AppColors.appPrimarycolor.withOpacity(0.5))),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
