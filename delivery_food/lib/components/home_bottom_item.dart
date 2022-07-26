import 'package:delivery_food/constans/app_colors.dart';
import 'package:flutter/cupertino.dart';



class HomeBottomItem extends StatelessWidget {
  final String assetImage;
  final String label;
  const HomeBottomItem({Key? key, required this.assetImage, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.lightgreen
      ),
      child: Row(
        children: [
          Image.asset(assetImage),
          Text(label)
        ],
      ),
    );
  }
}
