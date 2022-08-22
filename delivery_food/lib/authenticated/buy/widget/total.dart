import 'package:delivery_food/authenticated/buy/widget/sub_total.dart';
import 'package:delivery_food/constans/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Total extends StatelessWidget {
  final int subtotal;
  final int deliverycharge;
  final int discount;
  const Total({Key? key, required this.subtotal, required this.discount, required this.deliverycharge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.27,
      width: double.infinity,
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: AssetImage('assets/images/OrderPattern.png'),
            fit: BoxFit.cover),
        gradient: const LinearGradient(
            colors: [AppColors.appLinerColorStart, AppColors.appLinerColorEnd]),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 25, 20, 10),
        child: Column(
          children: [
             Subtotal(label: 'Sub-total', cost: subtotal),
            Padding(
              padding:const EdgeInsets.symmetric(vertical: 8),
              child: Subtotal(label: 'Delivery Charge', cost: deliverycharge),
            ),
            Subtotal(label: 'Discount', cost: discount),
             Padding(
              padding:const EdgeInsets.symmetric(vertical: 20),
              child: Subtotal(
                label: 'Total',
                cost: subtotal + deliverycharge - discount,
                size: 18,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.075,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: GradientText('Place My Order',
                    colors: const [
                      AppColors.appLinerColorStart,
                      AppColors.appLinerColorEnd
                    ],
                    style: const TextStyle(
                        fontFamily: 'BentonSans Bold', fontSize: 16)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
