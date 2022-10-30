import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';

import '../../Declarations/Constants/constants.dart';
import '../../Repository/homepage.dart';
import '../../ValueNotifier/homepage_notifier.dart';
import 'moves_animtion.dart';

class BottomInfo extends StatefulWidget {
  const BottomInfo({Key? key, required this.containerWidth}) : super(key: key);

  final int containerWidth;

  @override
  State<BottomInfo> createState() => _BottomInfoState();
}

class _BottomInfoState extends State<BottomInfo> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: homePageNotifier.n,
      builder: (context, value, _) {
        return SizedBox(
          width: (homePageNotifier.n.value *widget.containerWidth +
                  HomePageRepo().getPaddingSPace(homePageNotifier.n.value))
              .toDouble(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              DayNightSwitch(),
              AnimatedMoves(),
            ],
          ),
        );
      },
    );
  }
}

class DayNightSwitch extends StatefulWidget {
  const DayNightSwitch({Key? key}) : super(key: key);

  @override
  State<DayNightSwitch> createState() => _DayNightSwitch();
}

class _DayNightSwitch extends State<DayNightSwitch> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: HomePageRepo().getTheme(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              width: 65,
              child: DayNightSwitcher(
                isDarkModeEnabled: isDarkMode,
                onStateChanged: (bool value) {
                  setState(() {
                    isDarkMode = value;
                    HomePageRepo().saveTheme(isDarkMode);
                    HomePageRepo().getTheme();
                  });
                },
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
