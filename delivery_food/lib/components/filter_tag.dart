import 'package:delivery_food/components/app_alert_dialog.dart';
import 'package:delivery_food/components/reusable_home_card.dart';
import 'package:delivery_food/constans/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilterTag extends StatefulWidget {
  final String tagName;
  const FilterTag({Key? key, required this.tagName}) : super(key: key);

  @override
  State<FilterTag> createState() => _FilterTagState();
}

class _FilterTagState extends State<FilterTag> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return !isSelected ? Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ReusableHomeCard(
          child: TextButton(
              onPressed: ()async { 
                final pref = await SharedPreferences.getInstance();
                pref.setBool(widget.tagName, true);
                setState(() {
                  isSelected = true;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
                child: Text(
                  widget.tagName,
                  style: const TextStyle(
                      fontFamily: 'BentonSans Bold',
                      fontWeight: FontWeight.w100,
                      fontSize: 14,
                      
                      letterSpacing: 0.7,
                      color: AppColors.orange),
                ),
              ))),
    ):Container();
  }
}
