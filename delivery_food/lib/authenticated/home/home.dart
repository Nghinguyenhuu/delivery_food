import 'package:delivery_food/authenticated/details/menu_detail.dart';
import 'package:delivery_food/authenticated/details/restaurant_detail.dart';
import 'package:delivery_food/authenticated/home/widgets/menu_item.dart';
import 'package:delivery_food/authenticated/home/filter_screen.dart';
import 'package:delivery_food/data/data_source/home_data.dart';
import 'package:delivery_food/data/model/restaurant.dart';
import 'package:delivery_food/routes/fade_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:sliver_tools/sliver_tools.dart';
import '../../components/reusable_card.dart';
import '../../components/reusable_home_card.dart';
import '../../constans/app_colors.dart';
import '../../constans/app_stype.dart';
import 'package:delivery_food/widget/pattern.dart';

import '../../data/model/menu.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int restaurantCount = 4;
  int menuviewmore = 3;
  List<Restaurant> restaurants = allRestaurant;
  List<Dish> menus = allMenu;
  List<String> listFilter = [];
  bool isMenuViewmore = false;
  bool ispromo = true;
  void buildFiltertag()async{
    final pref =await SharedPreferences.getInstance();
    if(pref.getBool('Restaurant') != null){
      if(pref.getBool('Menu')==null){
        menus.clear();
      }
    }else if(pref.getBool('Menu') != null){
      restaurants.clear();
    }
    List<int> location = [];
    for (var element in restaurants) {
      if(pref.getBool('${element.deliveryTime}')!= null){
        location.add(element.deliveryTime);
      }
    }

  }

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
                                return searchContent(value);
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        const FilterScreen())));
                          },
                          icon: Image.asset('assets/icons/Filter.png')),
                    ))
                  ],
                )),
            buildHomeView()
          ],
        ),
      ),
    );
  }

  void searchContent(String query) {
    final input = query.toLowerCase();
    final suggestRestaurant = allRestaurant.where((element) {
      final restaurantName = element.name.toLowerCase();
      return restaurantName.contains(input);
    }).toList();
    final suggestMenu = allMenu.where((element) {
      final menuTitle = element.name.toLowerCase();
      return menuTitle.contains(input);
    }).toList();
    setState(() {
      restaurants = suggestRestaurant;
      menus = suggestMenu;
      ispromo = false;
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
            children: [
              const Text(
                'Popular Menu',
                style: kHomeSubjectStyle,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    menuviewmore = menus.length;
                    ispromo = false;
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
              cardChild: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  CustomPageRoute(
                      child: MenuDetail(
                    dish: menus[index],
                  )));
            },
            child: ListTile(
              leading: Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(menus[index].assetImage),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              trailing: Text(
                '\$ ${menus[index].price}',
                style: const TextStyle(
                    color: AppColors.gold,
                    fontSize: 20,
                    fontFamily: 'BentonSans Bold'),
              ),
              title: Text(
                menus[index].name,
                style: kHomeSubjectStyle,
              ),
              subtitle: Text(
                menus[index].ofRestaurant,
                style: kHintInputStyle,
              ),
            ),
          ));
        }, childCount: menus.length),
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
            children: [
              const Text(
                'Nearest Restaurant',
                style: kHomeSubjectStyle,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    ispromo = false;
                    isMenuViewmore = true;
                    if ((restaurantCount + 4) > restaurants.length) {
                      restaurantCount = restaurants.length;
                    } else {
                      restaurantCount += 4;
                    }
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
      !isMenuViewmore
          ? SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: HomeMenuItem(
                        restaurant: allRestaurant[index],
                        onPress: () {
                          Navigator.push(
                              context,
                              CustomPageRoute(
                                  child: RestaurantDetail(
                                isRestaurant: true,
                                restaurant: allRestaurant[index],
                              )));
                        },
                      ),
                    );
                  },
                  itemCount: restaurants.length,
                ),
              ),
            )
          : SliverGrid(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return ReusableCard(
                    cardChild: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        CustomPageRoute(
                            child: RestaurantDetail(
                          isRestaurant: true,
                          restaurant: restaurants[index],
                        )));
                  },
                  child: SizedBox(
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
                  ),
                ));
              }, childCount: restaurants.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20)),
    ]);
  }

  buildPromo() {
    return MultiSliver(children: [
      ispromo
          ? SliverToBoxAdapter(
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
                                    child: GradientText('Buy Now',
                                        colors: const [
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
            )
          : const SliverToBoxAdapter(),
    ]);
  }

  buildHomeView() {
    return MultiSliver(children: [
      buildPromo(),
      restaurants.isNotEmpty ? buildViewMoreRestaurant() : Container(),
      menus.isNotEmpty ? buildViewmoreMenu() : Container()
    ]);
  }
}
