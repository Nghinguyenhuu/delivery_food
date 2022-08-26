import 'package:delivery_food/authenticated/details/restaurant_detail.dart';
import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/constans/app_stype.dart';
import 'package:delivery_food/data/model/restaurant.dart';
import 'package:delivery_food/routes/fade_route.dart';
import 'package:flutter/material.dart';

class HomeMenuItem extends StatelessWidget {
  final Restaurant restaurant;
  final Function() onPress;
  const HomeMenuItem({Key? key, required this.restaurant, required this.onPress, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
                cardChild: GestureDetector(
              onTap: onPress,
              child: SizedBox(
                height: 300,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(restaurant.assetImage),
                    const SizedBox(height: 10,),
                     Text(
                      restaurant.name,
                      style: kHomeSubjectStyle,
                    ),
                    
                    Text(
                      '${restaurant.deliveryTime} mins',
                      style: kHintInputStyle,
                    )
                  ],
                ),
              ),
            )); 
  }
}