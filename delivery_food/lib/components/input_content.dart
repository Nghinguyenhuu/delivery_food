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
            obscureText: isPass,
          ),
          Align(alignment: Alignment.centerRight, child: iconeye(isPass)),
        ],
      ),
    );
  }
}

Widget? iconeye(bool isPass) {
  return isPass == true
      ? IconButton(onPressed: () {}, icon: Image.asset('assets/icons/Show.png'))
      : null;
}
