import 'package:delivery_food/constans/app_stype.dart';
import 'package:flutter/cupertino.dart';

class DistanceAndRating extends StatelessWidget {
  final bool ismenu;
  const DistanceAndRating({Key? key, this.ismenu = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          !ismenu ? Row(
            children: [
              Image.asset('assets/icons/mappin.png'),
              const SizedBox(width: 10,),
              Text('19 km',style: kHintInputStyle,)
            ],
          ): Container(),
          const SizedBox(width: 20,),
          Row(
            children: [
              Image.asset('assets/icons/halfStar.png'),
              const SizedBox(width: 10,),
              Text('4.8 rating',style: kHintInputStyle,)
            ],
          ),
          const SizedBox(width: 20,),
          ismenu ? Row(
            children: [
              Image.asset('assets/icons/shopping-bag.png'),
              const SizedBox(width: 10,),
              Text('2000+ Order',style: kHintInputStyle,)
            ],
          ):Container(),
        ],
      ),
    );
  }
}