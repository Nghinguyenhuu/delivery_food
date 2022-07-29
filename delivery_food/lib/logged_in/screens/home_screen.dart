import 'package:delivery_food/components/home_bottom_item.dart';
import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/components/reusable_home_card.dart';
import 'package:delivery_food/constans/app_colors.dart';
import 'package:delivery_food/constans/app_stype.dart';
import 'package:delivery_food/logged_in/screens/home.dart';
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
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      body:const Home() ,
      bottomNavigationBar: buildBottom(),
    );
  }

  buildBody() => const Home();
  buildBottom() => Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
                        assetImage: 'assets/icons/Profile.png',
                        label: 'Profile'),
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
