import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Declarations/Constants/constants.dart';
import '../main.dart';

class HomePageRepo {
  String contestName = "#PuzzleHack";

  Map<int, String> levels = {
    3: 'Beginner',
    4: 'Intermediate',
    5: '🔥 Advanced'
  };

  List pltforms = <String>[
    "Web",
    "Mobile",
    "Desktop",
  ];

  double getPaddingSPace(int n) {
    return ((25 * n) / 3);
  }

  Future<void> saveTheme(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setBool('isDarkMode', isDarkMode);
  }

  Future<bool> getTheme() async {
    final prefs = await SharedPreferences.getInstance();

    isDarkMode = prefs.getBool('isDarkMode') ?? false;
    runApp(MyApp(themeData: isDarkMode));
    return isDarkMode;
  }
}
