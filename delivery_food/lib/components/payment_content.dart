import 'package:delivery_food/components/reusable_card.dart';
import 'package:flutter/cupertino.dart';

class PaymentContent extends StatelessWidget {
  final VoidCallback onTap;
  final String asset;
  const PaymentContent({Key? key, required this.onTap, required this.asset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ReusableCard(
          cardChild: SizedBox(
              width: double.infinity, height: 70, child: Image.asset(asset))),
    );
  }
}
