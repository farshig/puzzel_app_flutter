import 'package:flutter/material.dart';

import '../Declarations/Constants/constants.dart';

class WidthSpacer extends StatelessWidget {
  const WidthSpacer({Key? key, required this.myWidth}) : super(key: key);
  final double myWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: myWidth);
  }
}

class HeightSpacer extends StatelessWidget {
  const HeightSpacer({Key? key, required this.myHeight}) : super(key: key);
  final double myHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: myHeight);
  }
}

class BuildImage extends StatelessWidget {
  const BuildImage({Key? key, required this.path}) : super(key: key);

  final String path;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
    );
  }
}

class BuildBtn extends StatelessWidget {
  const BuildBtn(
      {Key? key,
      required this.width,
      required this.child1,
      required this.child2,
      required this.containerColor,
      required this.myFunction})
      : super(key: key);

  final double width;
  final Widget child1, child2;
  final Color containerColor;
  final Function myFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => myFunction(),
      child: Container(
        width: width,
        decoration: BoxDecoration(borderRadius: kBorder, color: containerColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            child1,
            child2,
          ],
        ),
      ),
    );
  }
}
