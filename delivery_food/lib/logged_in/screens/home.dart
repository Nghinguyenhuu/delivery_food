import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../components/reusable_card.dart';
import '../../components/reusable_home_card.dart';
import '../../constans/app_colors.dart';
import '../../constans/app_stype.dart';
import 'package:delivery_food/widget/pattern.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Pattern(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 230,
                      child:
                          Text('Find Your Favorite Food', style: kTitleStyle),
                    ),
                    ReusableCard(
                      cardChild: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FontAwesomeIcons.bell,
                            color: AppColors.appLinerColorEnd,
                          )),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableHomeCard(
                        child: Form(
                      child: ReusableHomeCard(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.search,
                              color: AppColors.orange,
                            ),
                          ),
                          SizedBox(
                            width: 230,
                            height: 50,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'What do you want to order?',
                                  hintStyle: TextStyle(
                                      color: AppColors.orange.withOpacity(0.4)),
                                  border: InputBorder.none),
                            ),
                          )
                        ],
                      )),
                    )),
                    const SizedBox(
                      width: 20,
                    ),
                    ReusableHomeCard(
                        child: IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/icons/Filter.png')))
                  ],
                ),
              ],
            )),
            SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return ReusableCard(
                      cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 60,
                          height: 60,
                          child: Image.asset('assets/images/Logo.png')),
                      const Text(
                        'Vegan Resto',
                        style: kHeadingStyle,
                      ),
                      Text(
                        '12 Mins',
                        style: kHintInputStyle,
                      )
                    ],
                  ));
                }, childCount: 2),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20))
          ],
        ),
      ),
    );
  }
}
