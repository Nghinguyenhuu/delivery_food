
import 'package:flutter/cupertino.dart';

class Pattern extends StatelessWidget {
  final Widget child;
  const Pattern( {Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
          image:
              DecorationImage(image: AssetImage('assets/images/Pattern.png'),fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: child,
          )
    );
  }
}
