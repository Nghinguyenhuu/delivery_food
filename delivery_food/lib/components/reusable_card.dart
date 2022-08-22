
import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {

  final Widget cardChild;
  final double? padding;
  const ReusableCard({Key? key, required this.cardChild, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top:padding ?? 10 ,bottom: padding?? 10),
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