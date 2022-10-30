import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:puzzle_app/Declarations/Constants/constants.dart';
import '../../../../../ValueNotifier/homepage_notifier.dart';
import '../Widgets/1body.dart';

class MobileViewLayout extends StatefulWidget {
  const MobileViewLayout({Key? key}) : super(key: key);

  @override
  State<MobileViewLayout> createState() => _MobileViewLayoutState();
}

class _MobileViewLayoutState extends State<MobileViewLayout>
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => (homePageNotifier.setArray()),
        backgroundColor: Theme.of(context).brightness.name == "dark"
            ? secondaryColor
            : primaryColor,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
