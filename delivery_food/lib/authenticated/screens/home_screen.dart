import 'package:delivery_food/authenticated/screens/chat.dart';
import 'package:delivery_food/authenticated/screens/home.dart';
import 'package:delivery_food/authenticated/screens/shop.dart';
import 'package:delivery_food/components/home_bottom_item.dart';


import 'package:flutter/material.dart';

import 'profile.dart';


class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key,}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
 int currentIndex = 0;

  final List<Widget> screen = [
    const Home(),
    const Profile(),
    const Shop(),
    const Chat()
  ];

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      body: screen[currentIndex],
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
                    activeIcon:const HomeBottomItem(
                      assetImage: 'assets/icons/Home.png',
                      label: 'Home',
                      
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Image.asset('assets/icons/Profile.png'),
                    activeIcon:const HomeBottomItem(
                      assetImage: 'assets/icons/Profile.png',
                      label: 'Profile',
  
                    ),
                    label: 'Profile'),
                BottomNavigationBarItem(
                    icon: Image.asset('assets/icons/Buy.png'),
                    activeIcon:const HomeBottomItem(
                      assetImage: 'assets/icons/Buy.png',
                      label: 'Buy',
  
                    ),
                    label: 'Shop'),
                BottomNavigationBarItem(
                    icon: Image.asset('assets/icons/Chat.png'),
                    activeIcon:const HomeBottomItem(
                      assetImage: 'assets/icons/Chat.png',
                      label: 'Chat',
                    ),
                    label: 'Message'),
              ]),
        ),
      );
}
