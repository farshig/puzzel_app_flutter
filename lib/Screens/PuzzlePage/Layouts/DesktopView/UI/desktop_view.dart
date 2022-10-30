import 'package:flutter/material.dart';
import 'package:puzzle_app/Declarations/Constants/constants.dart';

import '../../../../../ValueNotifier/homepage_notifier.dart';
import '../Widgets/1body.dart';
import 'package:animated_background/animated_background.dart';

class DeskTopViewLayout extends StatefulWidget {
  const DeskTopViewLayout({Key? key}) : super(key: key);

  @override
  State<DeskTopViewLayout> createState() => _DeskTopViewLayoutState();
}

class _DeskTopViewLayoutState extends State<DeskTopViewLayout>
    with TickerProviderStateMixin {
  late Animation colorAnimation;
  late AnimationController controller;

  @override
  void initState() {
    homePageNotifier.setArray();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
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
    return Scaffold(
      body: AnimatedBackground(
          behaviour: RandomParticleBehaviour(
            options: ParticleOptions(
                spawnMaxRadius: 50,
                spawnMinSpeed: 10.00,
                particleCount: 68,
                spawnMaxSpeed: 50,
                minOpacity: 0.3,
                spawnOpacity: 0.4,
                baseColor: Theme.of(context).brightness.name == "light"
                    ? colorAnimation.value
                    : secondaryColor),
          ),
          vsync: this,
          child: const BuildBodyClass()),
    );
  }
}
