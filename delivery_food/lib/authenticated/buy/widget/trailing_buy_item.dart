import 'package:delivery_food/constans/app_colors.dart';
import 'package:flutter/material.dart';

class TrailingBuyItem extends StatefulWidget {
  const TrailingBuyItem({Key? key}) : super(key: key);

  @override
  State<TrailingBuyItem> createState() => _TrailingBuyItemState();
}

class _TrailingBuyItemState extends State<TrailingBuyItem> {
  int value = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 114,
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  if (value != 0) {
                    value--;
                  }
                });
              },
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
            '$value',
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  value++;
                });
              },
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
