import 'package:delivery_food/components/input_content.dart';
import 'package:delivery_food/components/reusable_card.dart';
import 'package:flutter/material.dart';


class FormFill extends StatelessWidget {
  final TextEditingController firstname;
  final TextEditingController lastname;
  final TextEditingController mobilenumber;
  const FormFill({Key? key, required this.firstname, required this.lastname, required this.mobilenumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        ReusableCard(
            cardChild: Padding(
          padding:const EdgeInsets.all(8.0),
          child: InputContent(label: 'First Name',myController: firstname,),
        )),
        ReusableCard(
            cardChild: Padding(
          padding:const EdgeInsets.all(8.0),
          child: InputContent(label: 'Last Name',myController: lastname,),
        )),
        ReusableCard(
            cardChild: Padding(
          padding:const EdgeInsets.all(8.0),
          child: InputContent(label: 'Mobile Phone',myController: mobilenumber,),
        )),
      ],
    ));
  }
}
