import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/constans/app_colors.dart';
import 'package:delivery_food/constans/app_stype.dart';
import 'package:delivery_food/data/data_source/home_data.dart';
import 'package:delivery_food/data/model/restaurant.dart';
import 'package:flutter/cupertino.dart';

class PopularMenu extends StatelessWidget {
  const PopularMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Restaurant> restaurants = allRestaurant;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'Popular Menu',
                style: kHomeSubjectStyle,
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'View All',
                  style: TextStyle(color: AppColors.orange),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: ReusableCard(
                    cardChild: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(restaurants[index].assetImage),
                      Text(
                        restaurants[index].name,
                        style: kHomeSubjectStyle,
                      ),
                      Text(
                        '${restaurants[index].deliveryTime} mins',
                        style: kHintInputStyle,
                      )
                    ],
                  ),
                )),
              );
            },
            itemCount: restaurants.length,
          ),
        ),
      ],
    );
  }
}
