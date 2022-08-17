import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_food/authenticated/details/widgets/distance_rating.dart';
import 'package:delivery_food/authenticated/details/widgets/navigation.dart';
import 'package:delivery_food/authenticated/details/widgets/popular_menu.dart';
import 'package:delivery_food/components/reusable_card.dart';

import 'package:delivery_food/constans/app_colors.dart';
import 'package:delivery_food/constans/app_stype.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class RestaurantDetail extends StatefulWidget {
  final bool isRestaurant;
  const RestaurantDetail({Key? key, required this.isRestaurant})
      : super(key: key);

  @override
  State<RestaurantDetail> createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  @override
  Widget build(BuildContext context) {
    final ref = FirebaseStorage.instance.ref().child('PhotoRestaurant.png');

    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: ((context, snapshot) {
          return Scaffold(
            body: SafeArea(
              child: CustomScrollView(
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
                        'assets/images/PhotoRestaurant.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      // title: FutureBuilder<String>(
                      //   future: ref.getDownloadURL(),
                      //   builder: ((context, snapshot) {
                      //     if (snapshot.hasData &&
                      //         snapshot.connectionState ==
                      //             ConnectionState.done) {
                      //       return Text(
                      //         snapshot.data!.toString(),
                      //         style:
                      //             TextStyle(fontSize: 30, color: Colors.white),
                      //       );
                      //     }
                      //     return const CircularProgressIndicator();
                      //   }),
                      // ),
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
                            'Wijie Bar and Resto',
                            style: kTitleStyle,
                          ),
                          DistanceAndRating(),
                          Text(
                            'Most whole Alaskan Red King Crabs get broken down into legs, claws, and lump meat. We offer all of these options as well in our online shop, but there is nothing like getting the whole . . . .',
                            style: kTextSubTitle,
                          ),
                          PopularMenu(),
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
                                image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/PhotoProfile.png'),
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
                                    const Text(
                                      'Dianne Russell',
                                      style: kHomeSubjectStyle,
                                    ),
                                    Text(
                                      '12 April 2021',
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
                                        Image.asset(
                                            'assets/icons/fullStar.png'),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        GradientText(
                                          '5',
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
                            subtitle: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                  'This Is great, So delicious! You Must Here, With Your family . . '),
                            ),
                          ),
                        ),
                      ),
                    );
                  }, childCount: 4))
                ],
              ),
            ),
          );
        }));
  }
}
