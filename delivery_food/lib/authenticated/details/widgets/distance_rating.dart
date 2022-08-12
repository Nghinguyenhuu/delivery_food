import 'package:delivery_food/constans/app_stype.dart';
import 'package:flutter/cupertino.dart';

class DistanceAndRating extends StatelessWidget {
  const DistanceAndRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Row(
            children: [
              Image.asset('assets/icons/mappin.png'),
              const SizedBox(width: 10,),
              Text('19 km',style: kHintInputStyle,)
            ],
          ),
          const SizedBox(width: 20,),
          Row(
            children: [
              Image.asset('assets/icons/halfStar.png'),
              const SizedBox(width: 10,),
              Text('4.8 rating',style: kHintInputStyle,)
            ],
          ),
        ],
      ),
    );
  }
}