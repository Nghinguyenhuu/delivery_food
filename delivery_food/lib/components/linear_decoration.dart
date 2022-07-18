import 'package:flutter/cupertino.dart';

import '../constans/app_colors.dart';

 BoxDecoration boxLinear(){
    return  BoxDecoration(
          gradient:const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.topRight,
              colors: [
                AppColors.appLinerColorStart,
                AppColors.appLinerColorEnd
              ]),
              borderRadius: BorderRadius.circular(15.0),
        );
  }
  LinearGradient appLinearColor(){
    return const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.topRight,
              colors: [
                AppColors.appLinerColorStart,
                AppColors.appLinerColorEnd
              ]) ;
  }

  



