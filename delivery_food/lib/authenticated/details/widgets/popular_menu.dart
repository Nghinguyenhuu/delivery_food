import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/constans/app_colors.dart';
import 'package:delivery_food/constans/app_stype.dart';
import 'package:delivery_food/data/data_source/home_data.dart';
import 'package:delivery_food/data/model/menu.dart';
import 'package:delivery_food/routes/fade_route.dart';
import 'package:flutter/cupertino.dart';

import '../menu_detail.dart';

class PopularMenu extends StatelessWidget {
  const PopularMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Dish> menus = allMenu;
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
                    cardChild: GestureDetector(
                      onTap: (){Navigator.push(context, CustomPageRoute(child: MenuDetail(dish: menus[index],)));},
                      child: SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.35,
                                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(menus[index].assetImage),
                        const SizedBox(height: 20,),
                        Text(
                          menus[index].name,
                          style: kHomeSubjectStyle,
                        ),
                        Text(
                          '${menus[index].price} \$',
                          style: kHintInputStyle,
                        )
                      ],
                                      ),
                                    ),
                    )),
              );
            },
            itemCount: menus.length,
          ),
        ),
      ],
    );
  }
}
