import 'package:flutter/material.dart';
import 'package:odometer/odometer.dart';
import '../../Declarations/Constants/constants.dart';
import '../../ValueNotifier/homepage_notifier.dart';
import '../1g_widgets.dart';

class AnimatedMoves extends StatelessWidget {
  const AnimatedMoves({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: homePageNotifier.moves,
        builder: (context, value, _) {
          return Row(
            children: [
              AnimatedSlideOdometerNumber(
                numberTextStyle: TextStyle(
                  fontSize: 20,
                  color: secondaryColor,
                ),
                odometerNumber: OdometerNumber(homePageNotifier.moves.value),
                duration: const Duration(milliseconds: 500),
                letterWidth: 12,
              ),
              const WidthSpacer(myWidth: 5.5),
              Text(
                "moves",
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 20,
                ),
              ),
            ],
          );
        });
  }
}
