import 'package:flutter/material.dart';
import '../../Declarations/Constants/constants.dart';
import '../../ValueNotifier/homepage_notifier.dart';
import '../1g_widgets.dart';

class ShuffleBtn extends StatelessWidget {
  const ShuffleBtn({Key? key, required this.containerSize, required this.myFontSize}) : super(key: key);

  final double containerSize;
  final double myFontSize;

  @override
  Widget build(BuildContext context) {
    return BuildBtn(
        width: containerSize,
        child1: const Icon(
          Icons.refresh,
          color: Colors.white,
        ),
        child2: Padding(
          padding: kPadding * 1.5,
          child:  Text(
            "Shuffle",
            style: TextStyle(color: Colors.white, fontSize: myFontSize),
          ),
        ),
        containerColor: secondaryColor,
        myFunction: () => homePageNotifier.setArray());
  }
}
