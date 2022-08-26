import 'package:delivery_food/authenticated/details/menu_detail.dart';
import 'package:delivery_food/authenticated/profile/edit_profile.dart';
import 'package:delivery_food/authenticated/profile/widgets/buy_again.dart';
import 'package:delivery_food/authenticated/profile/widgets/nametag.dart';
import 'package:delivery_food/authenticated/profile/widgets/rankmember.dart';
import 'package:delivery_food/authenticated/profile/widgets/voucher.dart';
import 'package:delivery_food/components/app_alert_dialog.dart';
import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/constans/app_colors.dart';
import 'package:delivery_food/constans/app_stype.dart';
import 'package:delivery_food/data/data_source/home_data.dart';
import 'package:delivery_food/data/model/menu.dart';
import 'package:delivery_food/data/model/user.dart';
import 'package:delivery_food/routes/fade_route.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Profile extends StatelessWidget {
  final User user;
  const Profile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoriteFood = allMenu;
    String name = user.firstname! + user.lastname!;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          pinned: true,
          toolbarHeight: 100,
          expandedHeight: 300,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.zero,
            title: Image.asset(
              'assets/images/PhotoProfile.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
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
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RankMember(),
                Nametag(
                  email: user.email == null ? 'Unknown' : user.email!,
                  name: user.firstname == null
                      ? user.username!
                      : '${user.firstname} ${user.lastname}',
                  onPressed: () {
                    Navigator.push(
                        context,
                        CustomPageRoute(
                            child: EditProfile(
                          user: user,
                        )));
                  },
                ),
                const Voucher(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Favorite',
                    style: kHeadingStyle,
                  ),
                )
              ],
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap:()=> Navigator.push(context, CustomPageRoute(child:MenuDetail(dish: favoriteFood[index]) )),
                child: buildFavoriteFood(favoriteFood[index], context)),
          );
        }, childCount: favoriteFood.length))
      ],
    );
  }

  Widget buildFavoriteFood(Dish menu, BuildContext context) {
    return ReusableCard(
      cardChild: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
            leading: Image.asset(menu.assetImage),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  menu.name,
                  style: kHomeSubjectStyle,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  menu.ofRestaurant,
                  style: kHintInputStyle,
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
            subtitle: GradientText(
              '\$ ${menu.price}',
              colors: const [
                AppColors.appLinerColorStart,
                AppColors.appLinerColorEnd
              ],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            trailing: BuyAgain(
              onPressed: (){
               
              },
            )),
      ),
    );
  }
}
