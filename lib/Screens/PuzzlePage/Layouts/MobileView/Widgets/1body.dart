import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:puzzle_app/Declarations/Constants/constants.dart';
import 'package:puzzle_app/Repository/homepage.dart';
import '../../../../../Declarations/Images/image_files.dart';
import '../../../../../ValueNotifier/homepage_notifier.dart';
import '../../../../../Widgets/1g_widgets.dart';
import '../../../../../Widgets/HomePageCmts/day_night_switcher.dart';
import '../../../../../Widgets/HomePageCmts/puzzle_widget.dart';
import '../../../../../Widgets/HomePageCmts/shuffle_btn.dart';
import '2tab_widget.dart';

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
                  : [HexColor("#01407a").withOpacity(0.9), HexColor("000000")])),
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height - 200,
              right: -0,
              child: Image.asset(
                images[5],
                height: 200,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height - 60,
              left: -10,
              child: Image.asset(
                images[6],
                height: 70,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                images[7],
                height: 100,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const HeightSpacer(myHeight: 10),
                const FlutterLogo(size: 50),
                const HeightSpacer(myHeight: 5.5),
                Text(
                  HomePageRepo().contestName,
                  style: TextStyle(
                      fontSize: 30,
                      color: Theme.of(context).brightness.name == "dark"
                          ? secondaryColor
                          : primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                const TabWidget(),
                const BuildPuzzleContainer(
                  containerWidth: 75,
                ),
                const HeightSpacer(myHeight: 10),
                const BottomInfo(
                  containerWidth: 75,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
