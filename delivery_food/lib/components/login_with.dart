
import 'package:flutter/material.dart';

import '../constans/app_stype.dart';
import 'reusable_card.dart';

class ContinueWith extends StatelessWidget {
  const ContinueWith({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Or Continue With',
                    style: kSubTitleStyle,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableCard(
                        cardChild: SizedBox(
                      height: 60,
                      width: 150,
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: Image.asset('assets/icons/facebook.png'),
                          label: const Text(
                            'FaceBook',
                            style: kSubTitleStyle,
                          )),
                    )),
                    ReusableCard(
                        cardChild: SizedBox(
                      height: 60,
                      width: 150,
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: Image.asset('assets/icons/google.png'),
                          label: const Text(
                            'Google',
                            style: kSubTitleStyle,
                          )),
                    )),
                  ],
                ),
                
      ],
    );
  }
}