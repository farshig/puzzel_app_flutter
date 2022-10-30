import 'package:flutter/material.dart';
import 'Screens/PuzzlePage/UI/home_page.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key, this.themeData = false}) : super(key: key);

  final bool themeData;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeData ? ThemeData.dark() : ThemeData.light(),
      home: const MyHomePage(),
    );
  }
}
