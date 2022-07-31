import 'package:delivery_food/data/data_source/home_data.dart';
import 'package:delivery_food/data/model/restaurant.dart';
import 'package:delivery_food/logged_in/screens/filter_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../components/reusable_card.dart';
import '../../components/reusable_home_card.dart';
import '../../constans/app_colors.dart';
import '../../constans/app_stype.dart';
import 'package:delivery_food/widget/pattern.dart';

import '../../data/model/menu.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentindex = 0;
  List<Restaurant> restaurants = allRestaurant;
  List<Menu> menus = allMenu;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Pattern(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
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
            ),
            SliverAppBar(
                pinned: true,
                titleSpacing: 0,
                elevation: 0,
                centerTitle: false,
                expandedHeight: 50,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.blue.withOpacity(0),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ReusableHomeCard(
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
                              onChanged: ((value) {
                                return searchContent(value) ;
                              }),
                              decoration: InputDecoration(
                                  hintText: 'What do you want to order?',
                                  hintStyle: TextStyle(
                                      color: AppColors.orange.withOpacity(0.4)),
                                  border: InputBorder.none),
                            ),
                          )
                        ],
                      )),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ReusableHomeCard(
                        child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: ((context) => const FilterScreen())));
                          },
                          icon: Image.asset('assets/icons/Filter.png')),
                    ))
                  ],
                )),
            currentindex == 0
                ? buildHomeView()
                : (currentindex == 1
                    ? buildViewMoreRestaurant()
                    : buildViewmoreMenu())
          ],
        ),
      ),
    );
  }

  void searchContent(String query){
    final input = query.toLowerCase();
    final suggestRestaurant = allRestaurant.where((restaurant){
      final restaurantName = restaurant.name.toLowerCase();
      return restaurantName.contains(input);
    }).toList();
    final suggestMenu = allMenu.where((element){
      final menuTitle = element.name.toLowerCase();
      return menuTitle.contains(input) ;
    }).toList();
    setState(() {
      restaurants = suggestRestaurant;
      menus = suggestMenu;
    });
  }

  buildViewmoreMenu() {
    return MultiSliver(children: [
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                'Popular Menu',
                style: kHomeSubjectStyle,
              ),
            ],
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return ReusableCard(
              cardChild: ListTile(
            leading: Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/images/MenuPhoto.png'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            title: const Text(
              'Herbal Pancake',
              style: kHomeSubjectStyle,
            ),
            subtitle: Text(
              'Warung Herbal',
              style: kHintInputStyle,
            ),
          ));
        }, childCount: 3),
      )
    ]);
  }

  buildViewMoreRestaurant() {
    return MultiSliver(children: [
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                'Nearest Restaurant',
                style: kHomeSubjectStyle,
              ),
            ],
          ),
        ),
      ),
      SliverGrid(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return ReusableCard(
                cardChild: SizedBox(
              height: 300,
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
            ));
          }, childCount: restaurants.length),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20))
    ]);
  }

  
  
  buildHomeView() {
    return MultiSliver(children: [
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Container(
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: const DecorationImage(
                    image: AssetImage('assets/images/Promocard.png'),
                    fit: BoxFit.cover),
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.appLinerColorStart,
                      AppColors.appLinerColorEnd
                    ])),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 100,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 144,
                      height: 44,
                      child: Text(
                        'Special Deal For October',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'BentonSans Bold',
                            fontSize: 17),
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: GradientText('Buy Now', colors: const [
                                AppColors.appLinerColorStart,
                                AppColors.appLinerColorEnd
                              ]),
                            ))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'Nearest Restaurant',
                style: kHomeSubjectStyle,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentindex = 1;
                  });
                },
                child: const Text(
                  'View More',
                  style: TextStyle(color: AppColors.orange),
                ),
              )
            ],
          ),
        ),
      ),
      SliverGrid(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return ReusableCard(
                cardChild: SizedBox(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/Logo.png'),
                  const Text(
                    'Vegan Resto',
                    style: kHomeSubjectStyle,
                  ),
                  Text(
                    '12 Mins',
                    style: kHintInputStyle,
                  )
                ],
              ),
            ));
          }, childCount: 2),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20)),
      SliverToBoxAdapter(
        child: Padding(
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
                onTap: () {
                  setState(() {
                    currentindex = 2;
                  });
                },
                child: const Text(
                  'View More',
                  style: TextStyle(color: AppColors.orange),
                ),
              )
            ],
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return ReusableCard(
              cardChild: ListTile(
            leading: Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/images/MenuPhoto.png'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            title: const Text(
              'Herbal Pancake',
              style: kHomeSubjectStyle,
            ),
            subtitle: Text(
              'Warung Herbal',
              style: kHintInputStyle,
            ),
          ));
        }, childCount: 3),
      )
    ]);
  }
}
