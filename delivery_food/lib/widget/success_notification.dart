

import 'package:delivery_food/constans/app_colors.dart';
import 'package:delivery_food/constans/app_stype.dart';

import 'package:delivery_food/widget/cta_button.dart';
import 'package:flutter/material.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart';

class SuccessNotification extends StatefulWidget {
  final String label;
  final String buttontext;
  const SuccessNotification({Key? key, required this.label, required this.buttontext}) : super(key: key);

  @override
  State<SuccessNotification> createState() => _SuccessNotificationState();
}

class _SuccessNotificationState extends State<SuccessNotification>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    animation = Tween<double>(begin: 0, end: 1).animate(controller);
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: const Duration(milliseconds: 300),
                  builder: (context, _, child) {
                    return ScaleTransition(
                      scale: controller.view,
                      child: Column(
                        children: [
                          Image.asset('assets/images/success.png'),
                          const SizedBox(
                            height: 20,
                          ),
                          GradientText(
                            'Congrats!',
                            colors: const [
                              AppColors.appLinerColorStart,
                              AppColors.appLinerColorEnd
                            ],
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Viga',
                                letterSpacing: 1),
                          )
                        ],
                      ),
                    );
                  }),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Your Profile Is Ready To Use',
                style: kHeadingStyle,
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: CTAButton(
                onTap: () {
                },
                label: widget.buttontext),
          ),
        )
      ],
    );
  }
}
