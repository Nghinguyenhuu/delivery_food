import 'package:delivery_food/constans/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RankMember extends StatelessWidget {
  const RankMember({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightpink,
        borderRadius: BorderRadius.circular(15)
      ),
      child:const Padding(
        padding: EdgeInsets.symmetric(vertical: 12,horizontal: 20),
        child: Text('Member Gold',style: TextStyle(fontFamily:'BentonSans Medium',color: AppColors.gold ),),
      ),
    );
  }
}
