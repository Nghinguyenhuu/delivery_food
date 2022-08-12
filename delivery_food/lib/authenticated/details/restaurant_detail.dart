import 'package:delivery_food/authenticated/details/widgets/distance_rating.dart';
import 'package:delivery_food/authenticated/details/widgets/navigation.dart';
import 'package:delivery_food/authenticated/details/widgets/popular_menu.dart';
import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/constans/app_colors.dart';
import 'package:delivery_food/constans/app_stype.dart';
import 'package:flutter/material.dart';

class RestaurantDetail extends StatelessWidget {
  const RestaurantDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
              'assets/images/PhotoRestaurant.png',
              width: double.maxFinite,
              fit: BoxFit.cover,
            )),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: Container(
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0))),
                  child: Center(
                      child: Container(
                    height: 5,
                    width: 60,
                    decoration: BoxDecoration(
                        color: AppColors.lightpink,
                        borderRadius: BorderRadius.circular(5)),
                  )),
                )),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Navigation(),
                  Text(
                    'Wijie Bar and Resto',
                    style: kTitleStyle,
                  ),
                  DistanceAndRating(),
                  Text(
                    'Most whole Alaskan Red King Crabs get broken down into legs, claws, and lump meat. We offer all of these options as well in our online shop, but there is nothing like getting the whole . . . .',
                    style: kTextSubTitle,
                  ),
                  PopularMenu()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
