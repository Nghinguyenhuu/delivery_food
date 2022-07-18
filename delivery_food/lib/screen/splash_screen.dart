
import 'package:flutter/material.dart';

import '../widget/logo.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Container(
          decoration:const BoxDecoration(
            color: Color(0xFFFFFFFF),
            image: DecorationImage(
              image: AssetImage('assets/images/Pattern.png')
            )
          ),
          child:  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:const [
                Logo()
              ],
            ),
          ),
        ),
      ),
    ) ;
  }
}