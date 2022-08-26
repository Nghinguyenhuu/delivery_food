import 'package:delivery_food/components/filter_tag.dart';
import 'package:delivery_food/components/reusable_home_card.dart';
import 'package:delivery_food/data/data_source/home_data.dart';
import 'package:delivery_food/data/model/menu.dart';
import 'package:delivery_food/data/model/restaurant.dart';
import 'package:delivery_food/widget/cta_button.dart';
import 'package:delivery_food/widget/pattern.dart';
import 'package:flutter/material.dart';

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
    List<Restaurant> restaurants = allRestaurant;
    List<Dish> menu = allMenu;
    List<String> typefood=[];
    for (var i = 0; i < menu.length; i++) {
      if(typefood.contains(menu[i].food)){ 
      }else{
        typefood.add(menu[i].food);
      }
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false ,
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
                const SizedBox(height: 20,),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
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
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Location',
                    style: kHomeSubjectStyle,
                  ),
                ),
                Wrap(
                  spacing: 20,
                  children: const [
                    FilterTag(tagName: '1 Km'),
                    FilterTag(tagName: '<10 Km'),
                    FilterTag(tagName: '>10 Km')
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical:10),
                  child: Text(
                    'Food',
                    style: kHomeSubjectStyle,
                  ),
                ),
                Wrap(
                  spacing: 20,
                  children: const [
                    FilterTag(tagName: 'Cake'),
                    FilterTag(tagName: 'Soup'),
                    FilterTag(tagName: 'MainCourse'),
                    FilterTag(tagName: 'Appetizer'),
                    FilterTag(tagName: 'Dessert'),
                  ],
                ),
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
