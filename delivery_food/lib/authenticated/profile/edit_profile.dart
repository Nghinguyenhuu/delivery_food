import 'package:delivery_food/components/input_content.dart';
import 'package:delivery_food/constans/app_colors.dart';
import 'package:delivery_food/constans/app_stype.dart';
import 'package:delivery_food/data/model/user.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  final User user;
  const EditProfile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
                'assets/images/PhotoProfile.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
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
          const SliverToBoxAdapter(
            child: Center(
              child: Text(
                'Edit Profile',
                style: kTitleStyle,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Your name : ',style: kHeadingStyle,),
                  
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
