import 'package:confetti/confetti.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:puzzle_app/Declarations/Images/image_files.dart';
import 'package:puzzle_app/Widgets/1g_widgets.dart';
import '../../../../../BreakPoints/breakpoints.dart';
import '../../../../../Declarations/Constants/constants.dart';
import '../../../../../Repository/homepage.dart';
import '../../../../../ValueNotifier/homepage_notifier.dart';
import '../../../../../Widgets/HomePageCmts/day_night_switcher.dart';
import '../../../../../Widgets/HomePageCmts/moves_animtion.dart';
import '../../../../../Widgets/HomePageCmts/puzzle_widget.dart';
import '2left_area_text.dart';

class BuildBodyClass extends StatelessWidget {
  const BuildBodyClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: Theme.of(context).brightness.name == "light"
                  ? [HexColor("9ED1FF").withOpacity(0.9), HexColor("FFFFFF")]
                  : [
                      HexColor("#01407a").withOpacity(0.9),
                      HexColor("000000")
                    ])),
      height: double.infinity,
      child: SingleChildScrollView(
          child: Stack(
        alignment: Alignment.center,
        children: [
          ResponsiveLayoutClass.isDesktop(context)
              ? Positioned(
                  top: -100,
                  left: 470,
                  child: Image.asset(
                    images[3],
                    height: 600,
                  ),
                )
              : const SizedBox(),
          Positioned(
            bottom: -120,
            right: -0,
            child: Image.asset(
              images[4],
              height: 295,
            ),
          ),
          Positioned(
            top: -0,
            left: -0,
            child: Image.asset(
              images[0],
              height: 100,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const LeftTextAreaClass(),
              Padding(
                padding: ResponsiveLayoutClass.isTablet(context)
                    ? const EdgeInsets.only(
                        left: 0, right: 10, top: 30, bottom: 10)
                    : const EdgeInsets.only(
                        left: 0, right: 120, top: 30, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    BuildPuzzleContainer(
                      containerWidth: 100,
                    ),
                    HeightSpacer(myHeight: 10),
                    BottomInfo(
                      containerWidth: 100,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      )),
    );
  }
}
