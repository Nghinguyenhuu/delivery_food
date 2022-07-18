import 'package:delivery_food/components/linear_decoration.dart';
import 'package:flutter/material.dart';

class CTAButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final double? height;
  final double? weight;
  const CTAButton({Key? key, required this.onTap, required this.label, this.height, this.weight,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height1 = height ?? 57;
    double weight1 = weight ?? 160;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height1,
        width: weight1,
        decoration: boxLinear(),
        child: Text(label,
            style: const TextStyle(
                fontFamily: 'BentonSans Bold',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white)),
      ),
    );
  }
}




