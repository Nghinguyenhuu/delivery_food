
import 'package:flutter/material.dart';

class DetailsButton extends StatelessWidget {
  final Widget icon;
  final Color color;
  const DetailsButton({Key? key, required this.icon, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 34,
        width: 34,
        decoration: BoxDecoration(
            color: color, shape: BoxShape.circle),
        child: icon,
      ),
    );
  }
}
