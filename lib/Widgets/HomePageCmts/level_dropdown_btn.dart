import 'package:flutter/material.dart';

import '../../Declarations/Constants/constants.dart';
import '../../Repository/homepage.dart';
import '../../ValueNotifier/homepage_notifier.dart';
import '../1g_widgets.dart';

class LevelBtn extends StatelessWidget {
  const LevelBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: homePageNotifier.n,
        builder: (context, value, _) {
          return BuildBtn(
              width: 250,
              child1: const Padding(
                padding: EdgeInsets.only(right: 9.0),
                child: Text(
                  "Level",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              child2:
                  Padding(padding: kPadding * 0.32, child: buildDropDownMenu()),
              containerColor: primaryColor,
              myFunction: () => {});
        });
  }

  Widget buildDropDownMenu() => DropdownButton<String>(
        focusColor: Colors.transparent,
        alignment: Alignment.center,
        value: HomePageRepo().levels[homePageNotifier.n.value],
        underline: Container(height: 2, color: Colors.white),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        ),
        iconSize: 24,
        elevation: 16,
        items: HomePageRepo().levels.entries.map((items) {
          return DropdownMenuItem<String>(
            value: items.value,
            child: Text(
              items.value,
              style: TextStyle(
                color: secondaryColor,
                fontSize: 20,
              ),
            ),
          );
        }).toList(),
        onChanged: (newValue) {
          var keys = HomePageRepo().levels.entries.firstWhere((element) {
            return element.value == newValue;
          });
          homePageNotifier.updateNVal(ValueNotifier(keys.key));
        },
      );
}
