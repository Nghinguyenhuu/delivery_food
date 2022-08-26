import 'package:delivery_food/authenticated/details/widgets/distance_rating.dart';
import 'package:delivery_food/authenticated/details/widgets/navigation.dart';
import 'package:delivery_food/components/app_alert_dialog.dart';
import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/constans/app_stype.dart';
import 'package:delivery_food/data/model/comment.dart';
import 'package:delivery_food/data/model/menu.dart';
import 'package:delivery_food/widget/cta_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../constans/app_colors.dart';

class MenuDetail extends StatelessWidget {
  final Dish dish;
  const MenuDetail({Key? key, required this.dish}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(children: [
        CustomScrollView(
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
                  'assets/images/PhotoMenu.png',
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Navigation(),
                    Text(
                      'Rainbow Sandwich Sugarless',
                      style: kTitleStyle,
                    ),
                    DistanceAndRating(
                      ismenu: true,
                    ),
                    Text(
                      'Most whole Alaskan Red King Crabs get broken down into legs, claws, and lump meat. We offer all of these options as well in our online shop, but there is nothing like getting the whole . . . .',
                      style: kTextSubTitle,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Testimonials',
                        style: kHomeSubjectStyle,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              Comment comment = dish.comments[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ReusableCard(
                  cardChild: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(comment.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                comment.name,
                                style: kHomeSubjectStyle,
                              ),
                              Text(
                                comment.date,
                                style: kHintInputStyle,
                              )
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.lightgreen,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Image.asset('assets/icons/fullStar.png'),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  GradientText(
                                    comment.start,
                                    colors: const [
                                      AppColors.appLinerColorStart,
                                      AppColors.appLinerColorEnd
                                    ],
                                    style: const TextStyle(
                                        fontFamily: 'BentonSans Bold',
                                        fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(comment.description),
                      ),
                    ),
                  ),
                ),
              );
            }, childCount: 4))
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: CTAButton(
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('${dish.id}', true);
                showDialog(
                    context: context,
                    builder: (context) => const AppAlert(
                        title: 'Success',
                        subtile: 'Dish has been added to cart'));
              },
              label: 'Add To Chart',
              weight: double.infinity,
            ),
          ),
        )
      ])),
    );
  }
}
