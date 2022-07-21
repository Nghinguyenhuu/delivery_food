import 'package:delivery_food/components/linear_decoration.dart';

import 'package:flutter/material.dart';


class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({Key? key}) : super(key: key);

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
   bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector (
      onTap: (){
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(     
        decoration: BoxDecoration(
          gradient: appLinearColor(),
          shape: BoxShape.circle ,        
        ),
        width: 24,
        height: 24,
        child: _isSelected ? const Icon(Icons.check_outlined, color: Colors.white,size: 16,) : null,
      ),
    );
  }
}