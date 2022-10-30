import 'package:flutter/material.dart';
import '../../Declarations/Constants/constants.dart';
import '../../Repository/homepage.dart';

class TweenAnimationClass extends StatefulWidget {
  const TweenAnimationClass({Key? key}) : super(key: key);

  @override
  State<TweenAnimationClass> createState() => _TweenAnimationClassState();
}

class _TweenAnimationClassState extends State<TweenAnimationClass>
    with TickerProviderStateMixin {
  late Animation colorAnimation;
  late AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    colorAnimation = ColorTween(begin: primaryColor, end: secondaryColor)
        .animate(controller);
    controller.addListener(() {
      setState(() {});
    });

    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      HomePageRepo().contestName,
      style: TextStyle(
        color: colorAnimation.value,
        fontSize: 50,
      ),
    );
  }
}
