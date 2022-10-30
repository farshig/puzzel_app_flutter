import 'package:flutter/material.dart';

import '../../../BreakPoints/breakpoints.dart';
import '../Layouts/DesktopView/UI/desktop_view.dart';
import '../Layouts/MobileView/UI/mobile_view.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayoutClass(
        mobileView:  MobileViewLayout(),
        tabletView: MobileViewLayout(),
        desktopView: DeskTopViewLayout(),
      ),
    );
  }
}