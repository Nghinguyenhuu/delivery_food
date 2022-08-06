
import 'package:delivery_food/constans/app_colors.dart';
import 'package:delivery_food/unauthenticated/sign_up/signup_screen.dart';


import 'package:flutter/material.dart';

import '../../widget/cta_button.dart';



class OnBoardingScreen2 extends StatelessWidget {
  const OnBoardingScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color:const Color(0xFFFFFFFF),
          child: Stack(
            children: [
              Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  const [
                SizedBox(height: 40),
                Image(
                  image: AssetImage('assets/images/Illustration2.png'),
                  height: 435,
                  width: double.infinity,
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: 350,
                  child: Text(
                    'Food Ninja is Where Your Comfort Food Lives',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'BentonSans Bold',
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                      fontStyle: FontStyle.normal,
                      color: AppColors.appPrimarycolor,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                SizedBox(
                    width: 244,
                    child: Text(
                      'Enjoy a fast and smooth food delivery at your doorstep',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontFamily: 'BentonSans Book',
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                
              ],
            ),
             Align (
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: CTAButton(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>const SignUpScreen() ));
                }, label: 'Next'),
              ),
            )
            ],
             
          ),
        ),
      ),
      
    );
  }
}
