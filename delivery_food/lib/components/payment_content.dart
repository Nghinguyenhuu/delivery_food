import 'package:flutter/cupertino.dart';


class PaymentContent extends StatelessWidget {
  final VoidCallback onTap;
  final String asset;
  const PaymentContent({Key? key, required this.onTap, required this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: SizedBox(
            height: 70,
            width: double.infinity,
            child: Image.asset(asset)));
  }
}
