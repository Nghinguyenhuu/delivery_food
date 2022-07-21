import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/constans/app_colors.dart';
import 'package:delivery_food/constans/app_stype.dart';

import 'package:flutter/material.dart';


class Location extends StatelessWidget {
  final Function() onPress;
  const Location({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
        cardChild: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
          Row(
            children: const [
              Icon(Icons.location_city),
              SizedBox(width: 10.0),
              Text(
                'Your location',
                style: kSubTitleStyle,
              )
            ],
          ),
          const SizedBox(height:20,),
          TextButton(
              onPressed:onPress,
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: AppColors.lightgrey,
                    borderRadius: BorderRadius.circular(15.0)),
                child:const Center(
                  child: Text(
                    'Set Location',
                    style: kSubTitleStyle,
                  ),
                ),
              ))
      ],
    ),
        ));
  }
}
