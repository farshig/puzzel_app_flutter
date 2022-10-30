import 'package:flutter/material.dart';
import '../../../../../Declarations/Constants/constants.dart';
import '../../../../../ValueNotifier/homepage_notifier.dart';

class TabWidget extends StatefulWidget {
  const TabWidget({Key? key}) : super(key: key);

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      padding: kPadding,
      unselectedLabelColor: Colors.grey.withOpacity(0.75),
      labelColor: Theme.of(context).brightness.name == "dark"
          ? secondaryColor
          : hoverColor,
      physics: const BouncingScrollPhysics(),
      indicatorColor: Theme.of(context).brightness.name == "dark"
          ? hoverColor
          : secondaryColor,
      tabs: const [
        Tab(
          child: Text("Beginner"),
        ),
        Tab(
          child: Text("Intermediate"),
        ),
        Tab(
          child: Text("Advanced"),
        )
      ],
      controller: _tabController,
      indicatorSize: TabBarIndicatorSize.tab,
      onTap: (index) => renderPuzzles(),
    );
  }

  renderPuzzles() {
    if (_tabController.indexIsChanging) {
      homePageNotifier.updateNVal(ValueNotifier(_tabController.index + 3));
    }
  }
}
