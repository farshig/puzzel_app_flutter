import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../Declarations/Constants/constants.dart';
import '../../Repository/homepage.dart';
import '../1g_widgets.dart';

class AnimatedTextClass extends StatelessWidget {
  const AnimatedTextClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Row(
        children: [
          const FlutterLogo(
            size: 40,
          ),
          Text(
            "Flutter",
            style: TextStyle(color: secondaryColor, fontSize: 30),
          ),
          const WidthSpacer(myWidth: 10.00),
          Container(width: 2.5, height: 35, color: secondaryColor),
          const WidthSpacer(myWidth: 10.00),
          buildAnimatedText(),
        ],
      ),
    );
  }

  Widget buildAnimatedText() => Padding(
        padding: const EdgeInsets.only(top: 1.5),
        child: AnimatedTextKit(
          animatedTexts: [
            for (var i = 0; i < HomePageRepo().pltforms.length; i++)
              buildText(i),
          ],
          repeatForever: true,
          pause: const Duration(milliseconds: 50),
        ),
      );

  buildText(int index) {
    return RotateAnimatedText(
      HomePageRepo().pltforms[index],
      textStyle: TextStyle(
        fontSize: 30.0,
        color: secondaryColor,
      ),
    );
  }
}
