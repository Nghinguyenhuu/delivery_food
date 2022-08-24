import 'package:flutter/material.dart';

import '../../../constans/app_colors.dart';

class TrailingBuyItem extends StatelessWidget {
  final int count;
  final Function(int) onChange;
  const TrailingBuyItem({Key? key, required this.count, required this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 114,
      child: Row(
        children: [
          IconButton(
              onPressed: ()=> onChange(-1),
              icon: Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.lightgreen     
                    ),
                    child:const Icon(Icons.remove,color: AppColors.appLinerColorEnd,size: 16,),
              )),
          Text(
            '${count < 0 ? 0 : count}',
          ),
          IconButton(
              onPressed:() => onChange(1),
              icon: Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient:const LinearGradient(colors: [AppColors.appLinerColorStart,AppColors.appLinerColorEnd])
                ) ,
                    child:const Icon(Icons.add,color: Colors.white,size: 16,),
              )),
        ],
      ),
    );
  }
}
