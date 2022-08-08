import 'package:delivery_food/routes/fade_route.dart';
import 'package:delivery_food/routes/route.dart';
import 'package:delivery_food/unauthenticated/onboarding/onboarding.dart';

import 'package:delivery_food/widget/logo.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animation;
  late final Animation<double> _animation = CurvedAnimation(
    parent: animation,
    curve: Curves.fastOutSlowIn,
  );
  @override
  void initState() {
    animation = AnimationController(
        vsync: this, duration: const Duration(seconds: 2), value: 0)
      ..forward();

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacementNamed(context, RouteGenerator.onborading)
            .then((value) => animation.reset());
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              color: Color(0xFFFFFFFF),
              image: DecorationImage(
                  image: AssetImage('assets/images/Pattern.png'),
                  fit: BoxFit.cover)),
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return ScaleTransition(
                scale: _animation,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [Logo()],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
