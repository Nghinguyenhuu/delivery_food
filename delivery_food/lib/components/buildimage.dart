import 'dart:io';

import 'package:flutter/material.dart';

class BuildImage extends StatelessWidget {
  final File image;
  final Function() onPress;
  const BuildImage({Key? key, required this.image, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Container(
            height: 260,
            width: 260,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                    image: FileImage(image), fit: BoxFit.cover)),
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipOval(
                  child: Material(
                      color: Colors.white.withOpacity(0.5),
                      child: InkWell(
                        onTap: onPress,
                        child:const Padding(
                          padding:  EdgeInsets.all(4.0),
                          child:  Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      )),
                ),
              ),
            ),
          )),
    );
  }
}
