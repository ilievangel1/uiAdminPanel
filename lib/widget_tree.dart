import 'package:admin_panel_responsive_flutter/constants.dart';
import 'package:admin_panel_responsive_flutter/pages/drawer/drawer_page.dart';
import 'package:admin_panel_responsive_flutter/pages/panel_center/panel_center_page.dart';
import 'package:admin_panel_responsive_flutter/pages/panel_left/panel_left_page.dart';
import 'package:admin_panel_responsive_flutter/pages/panel_right/panel_right_page.dart';
import 'package:admin_panel_responsive_flutter/pages/widgets/app_bar_widget.dart';
import 'package:admin_panel_responsive_flutter/responsive_layout.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class WidgetTree extends StatefulWidget {
  @override
  _WidgetTreeState createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  int currentIndex = 1;

  List<Widget> _icons = [
    Icon(
      Icons.stacked_line_chart_rounded,
      size: 30,
      color: Constants.beigeAccent,
    ),
    Icon(
      Icons.stacked_bar_chart_rounded,
      size: 30,
      color: Constants.beigeAccent,
    ),
    Icon(
      Icons.bubble_chart_rounded,
      size: 30,
      color: Constants.beigeAccent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: !ResponsiveLayout.isPhone(context)
            ? Size.fromHeight(100)
            : Size.fromHeight(60),
        child: (ResponsiveLayout.isTinyLimit(context) ||
                ResponsiveLayout.isTinyHeightLimit(context))
            ? Container()
            : AppBarWidget(),
      ),
      body: ResponsiveLayout(
        tiny: Container(),
        phone: currentIndex == 0
            ? PanelLeftPage()
            : currentIndex == 1
                ? PanelCenterPage()
                : PanelRightPage(),
        tablet: Row(
          children: [
            Expanded(child: PanelLeftPage()),
            Expanded(
              child: PanelCenterPage(),
            )
          ],
        ),
        largeTablet: Row(
          children: [
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelCenterPage()),
            Expanded(
              child: PanelRightPage(),
            )
          ],
        ),
        computer: Row(
          children: [
            Expanded(child: DrawerPage()),
            Expanded(child: PanelLeftPage()),
            Expanded(
              child: PanelCenterPage(),
            ),
            Expanded(
              child: PanelRightPage(),
            )
          ],
        ),
      ),
      drawer: DrawerPage(),
      bottomNavigationBar: ResponsiveLayout.isPhone(context)
          ? CurvedNavigationBar(
              index: currentIndex,
              backgroundColor: Constants.greenDark,
              items: _icons,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              animationDuration: const Duration(milliseconds: 400),
              height: 60.0,
              color: Constants.greenLighter,
            )
          : SizedBox(),
    );
  }
}
