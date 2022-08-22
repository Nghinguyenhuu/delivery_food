import 'package:delivery_food/authenticated/buy/comfirm_order.dart';
import 'package:delivery_food/authenticated/buy/widget/total.dart';
import 'package:delivery_food/authenticated/buy/widget/trailing_buy_item.dart';
import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/constans/app_colors.dart';
import 'package:delivery_food/constans/app_stype.dart';
import 'package:delivery_food/routes/fade_route.dart';
import 'package:delivery_food/widget/leading_button.dart';
import 'package:delivery_food/widget/pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';


 
class Buy extends StatefulWidget {
  const Buy({Key? key}) : super(key: key);

  @override
  State<Buy> createState() => _BuyState();
}

class _BuyState extends State<Buy> {
  List<int> numProduct= [0,0,0]; 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: SafeArea(
            child: Pattern(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            LeadingButton(onPress: () {
              Navigator.pop(context);
            }),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Order details',
                style: kHeadingStyle,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Slidable(
                      endActionPane:
                          ActionPane(extentRatio: 0.25,
                            motion: const ScrollMotion(), children: [
                        Container(
                          decoration:const BoxDecoration(
                              color: AppColors.orange,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15))),
                          height: double.maxFinite,
                          width: 80,
                          child:const Center(
                            child: Icon(Icons.delete),
                          ),
                        )
                      ]),
                      child: ReusableCard(
                        padding: 0,
                          cardChild: Padding(
                            padding: const EdgeInsets.symmetric(vertical:10),
                            child: ListTile(
                                autofocus: true,
                                leading: Image.asset(
                                  'assets/images/MenuPhoto.png',
                                  width: 62,
                                  height: 62,
                                ),
                                title: const Text(
                                  'Spacy fresh crab',
                                  style: kSubTitleStyle,
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Waroenk kita',
                                      style: kHintInputStyle,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    GradientText(
                                      '\$ 35',
                                      colors: const [
                                        AppColors.appLinerColorStart,
                                        AppColors.appLinerColorEnd
                                      ],
                                      style: const TextStyle(
                                          fontFamily: 'BentonSans Bold',
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                                trailing:  TrailingBuyItem(count: numProduct[index],onChange: (int value){
                                  setState(() {
                                    numProduct[index] += value;
                                  });
                                },)),
                          )),
                    ),
                  );
                },
                itemCount: 3,
              ),
            ),
             Total(subtotal: calSubTotal(numProduct, [35,35,35]),deliverycharge: 10,discount: 20,onPress: (){
              Navigator.push(context,CustomPageRoute(child: ConfirmOrder(total:Total(subtotal: calSubTotal(numProduct, [35,35,35]),deliverycharge: 10,discount: 20,)) ));
             },),
          ],
        ))));
  }
  
  int calSubTotal(List<int> l1, List<int> l2 ) {
    int sum = 0;
    for (int i= 0;i<l1.length;i++) {
      sum += l1[i] * l2[i];
    }
    return sum ;
  }
}
