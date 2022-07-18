import 'package:delivery_food/components/input_content.dart';
import 'package:delivery_food/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FormFill extends StatelessWidget {
  const FormFill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: const [
        ReusableCard(
            cardChild: Padding(
          padding: EdgeInsets.all(8.0),
          child: InputContent(label: 'First Name'),
        )),
        ReusableCard(
            cardChild: Padding(
          padding: EdgeInsets.all(8.0),
          child: InputContent(label: 'Last Name'),
        )),
        ReusableCard(
            cardChild: Padding(
          padding: EdgeInsets.all(8.0),
          child: InputContent(label: 'Mobile Phone'),
        )),
      ],
    ));
  }
}
