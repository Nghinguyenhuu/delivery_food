import 'package:delivery_food/constans/app_colors.dart';
import 'package:flutter/cupertino.dart';


class ReusableHomeCard extends StatelessWidget {

  final Widget child;
  const ReusableHomeCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightorange,
        borderRadius: BorderRadius.circular(15.0)
      ),
      child: child,
    ) ;
  }
}