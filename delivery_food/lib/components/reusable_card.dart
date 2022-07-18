
import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {

  final Widget cardChild;
  const ReusableCard({Key? key, required this.cardChild}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 10),
      child: Container(
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [BoxShadow(
            color: Color(0xFFF4F4F4),
            blurRadius:30 ,
          ),
          ],
        ),
        child: cardChild,
      ),
    );
  }
}