
import 'package:delivery_food/constans/app_colors.dart';

import 'package:delivery_food/routes/route.dart';
import 'package:delivery_food/widget/cta_button.dart';

import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color:const Color(0xFFFFFFFF),
        child: Stack(
          children: [
            Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  const [
              SizedBox(height: 40),
              Image(
                image: AssetImage('assets/images/Illustartion.png'),
                height: 435,
                width: double.infinity,
              ),
              SizedBox(height: 40),
              SizedBox(
                width: 211,
                child: Text(
                  'Find your Comfort Food here',
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
                    'Here You Can find a chef or dish for every taste and color. Enjoy!',
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
                Navigator.pushNamed(context,RouteGenerator.onborading2);
              }  
              , label: 'Next'),
            ),
          )
          ],
           
        ),
      ),
      
    );
  }
}
