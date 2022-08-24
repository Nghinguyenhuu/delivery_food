import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/constans/app_stype.dart';
import 'package:flutter/cupertino.dart';


class Voucher extends StatelessWidget {
  final double? numVoucher;
  const Voucher({Key? key, this.numVoucher}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReusableCard(cardChild: 
     Padding(
       padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
       child: Row(
        children: [
          Image.asset('assets/icons/VoucherIcon.png'),
          const SizedBox(width: 20,),
          Text(numVoucher == null || numVoucher == 0 ? 'You don\'t have any voucher' : 
          'You have $numVoucher voucher',style: kHomeSubjectStyle,)
        ],
       ),
     )
    );
  }
}