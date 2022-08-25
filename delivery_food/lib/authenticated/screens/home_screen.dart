import 'package:delivery_food/authenticated/screens/chat.dart';
import 'package:delivery_food/authenticated/screens/home.dart';
import 'package:delivery_food/authenticated/buy/buy.dart';
import 'package:delivery_food/components/home_bottom_item.dart';
import 'package:delivery_food/data/model/user.dart';
import 'package:delivery_food/routes/fade_route.dart';

import 'package:flutter/material.dart';

import '../profile/profile.dart';

class HomeScreen extends StatefulWidget {
  final User users;
  const HomeScreen({
    Key? key,
    required this.users,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  
 int currentIndex = 0;
  final List<Widget> screen = [
    const Home(),
    const Profile(),
    const Buy(),
    const Chat()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      body: SafeArea(child: screen[currentIndex]),
      bottomNavigationBar: buildBottom(),
    );
  }

  buildBottom() => Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              showSelectedLabels: false,
              showUnselectedLabels: false,
              iconSize: 20,
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset('assets/icons/Home.png'),
                    activeIcon: const HomeBottomItem(
                      assetImage: 'assets/icons/Home.png',
                      label: 'Home',
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Image.asset('assets/icons/Profile.png'),
                    activeIcon: const HomeBottomItem(
                      assetImage: 'assets/icons/Profile.png',
                      label: 'Profile',
                    ),
                    label: 'Profile'),
                BottomNavigationBarItem(
                    icon: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context, CustomPageRoute(child: const Buy()));
                        },
                        icon: Image.asset('assets/icons/Buy.png')),
                    label: 'Buy'),
                BottomNavigationBarItem(
                    icon: Image.asset('assets/icons/Chat.png'),
                    activeIcon: const HomeBottomItem(
                      assetImage: 'assets/icons/Chat.png',
                      label: 'Chat',
                    ),
                    label: 'Message'),
              ]),
        ),
      );
}
