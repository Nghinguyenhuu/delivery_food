import 'package:delivery_food/components/filter_tag.dart';
import 'package:delivery_food/components/reusable_home_card.dart';
import 'package:delivery_food/widget/cta_button.dart';
import 'package:delivery_food/widget/pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../components/reusable_card.dart';
import '../../constans/app_colors.dart';
import '../../constans/app_stype.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Pattern(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
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
                ),
                ReusableHomeCard(
                    child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Icon(
                        Icons.search,
                        color: AppColors.orange,
                      ),
                    ),
                    Expanded(
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
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Type',
                    style: kHomeSubjectStyle,
                  ),
                ),
                Wrap(
                  spacing: 20,
                  children: const [
                    FilterTag(tagName: 'Restaurant'),
                    FilterTag(tagName: 'Menu'),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Type',
                    style: kHomeSubjectStyle,
                  ),
                ),
                Wrap(
                  spacing: 20,
                  children: const [
                    FilterTag(tagName: 'Restaurant'),
                    FilterTag(tagName: 'Menu'),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Type',
                    style: kHomeSubjectStyle,
                  ),
                ),
                Wrap(
                  spacing: 20,
                  children: const [
                    FilterTag(tagName: 'Restaurant'),
                    FilterTag(tagName: 'Menu'),
                  ],
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CTAButton(onTap: (){
                Navigator.pop(context);
              }, label: 'Search',weight: double.infinity,height: 60,),
            )
                      ],
        ),
      )),
    );
  }
}
