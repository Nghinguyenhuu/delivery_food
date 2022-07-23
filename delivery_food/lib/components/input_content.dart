import 'package:delivery_food/constans/app_stype.dart';
import 'package:flutter/material.dart';

class InputContent extends StatefulWidget {
  final Widget? icon;
  final String label;
  final bool? isPassword;
  const InputContent({
    Key? key,
    this.icon,
    required this.label,
    this.isPassword,
  }) : super(key: key);

  @override
  State<InputContent> createState() => _InputContentState();
}

class _InputContentState extends State<InputContent> {
  bool selected = false ;
  @override
  Widget build(BuildContext context) {
    bool isPass = widget.isPassword ?? false;
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Stack(
        children: [
          TextFormField(
            decoration: InputDecoration(
              icon: widget.icon,
              hintText: widget.label,
              hintStyle: kHintInputStyle,
              border: InputBorder.none,
            ),
            obscureText: selected,
          ),
          Align(alignment: Alignment.centerRight, child:isPass == true ? IconButton(onPressed: (){
            setState(() {
              selected = !selected;
            });
          }, icon: Image.asset(selected ? 'assets/icons/showout.png' : 'assets/icons/showup.png')): null ),
        ],
      ),
    );
  }
}


