import 'package:flutter/material.dart';

import '../../core/constants/image/image_constants.dart';

class Background extends StatelessWidget {
  final Widget? child;

  const Background({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              ImageConstants.instance.bottomImage,
              width: size.width,
            ),
          ),
          child!
        ],
      ),
    );
  }
}
