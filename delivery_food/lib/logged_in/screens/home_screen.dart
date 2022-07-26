import 'package:delivery_food/components/home_bottom_item.dart';
import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/components/reusable_home_card.dart';
import 'package:delivery_food/constans/app_colors.dart';
import 'package:delivery_food/constans/app_stype.dart';
import 'package:delivery_food/widget/pattern.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: buildBody(),
      bottomNavigationBar: buildBottom(),
    );
  }

  buildBottom() => Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) => setState(() {
                    currentIndex = index;
                  }),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              iconSize: 20,
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset('assets/icons/Home.png'),
                    activeIcon: const HomeBottomItem(
                        assetImage: 'assets/icons/Home.png', label: 'Home'),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Image.asset('assets/icons/Profile.png'),
                    activeIcon: const HomeBottomItem(
                        assetImage: 'assets/icons/Profile.png', label: 'Profile'),
                    label: 'Profile'),
                BottomNavigationBarItem(
                    icon: Image.asset('assets/icons/Buy.png'),
                    activeIcon: const HomeBottomItem(
                        assetImage: 'assets/icons/Buy.png', label: 'Buy'),
                    label: 'Shop'),
                BottomNavigationBarItem(
                    icon: Image.asset('assets/icons/Chat.png'),
                    activeIcon: const HomeBottomItem(
                        assetImage: 'assets/icons/Chat.png', label: 'Chat'),
                    label: 'Message'),
              ]),
        ),
      );
}

buildBody() => SafeArea(
      child: Pattern(
          child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 230,
                  child: Text('Find Your Favorite Food', style: kTitleStyle),
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
            )
          ],
        ),
      )),
    );

buildAppBar() => AppBar(
      title: const Text(
        'Find Your Favorite Food',
        style: kTitleStyle,
      ),
      elevation: 0.0,
      backgroundColor: Colors.white.withOpacity(0.0),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.bell,
              color: AppColors.appLinerColorEnd,
            ))
      ],
    );
