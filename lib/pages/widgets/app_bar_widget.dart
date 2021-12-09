import 'package:admin_panel_responsive_flutter/constants.dart';
import 'package:admin_panel_responsive_flutter/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

List<String> _buttonNames = ["Overview", "Revenue", "Sales", "Indicators"];
int _currentSelectedButton = 0;

class AppBarWidget extends StatefulWidget {
  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.greenDark,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Row(
        crossAxisAlignment: !ResponsiveLayout.isPhone(context)
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          if (ResponsiveLayout.isComputer(context))
            Container(
              margin: EdgeInsets.all(Constants.kPadding),
              height: double.infinity,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(0, 0),
                  spreadRadius: 1,
                  blurRadius: 10,
                )
              ], shape: BoxShape.circle),
              child: CircleAvatar(
                backgroundColor: Constants.orange,
                radius: 25,
                backgroundImage: AssetImage(
                  "images/mapp.png",
                ),
              ),
            )
          else
            IconButton(
              color: Colors.white,
              iconSize: 30,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu_rounded),
            ),
          SizedBox(width: Constants.kPadding),
          if (ResponsiveLayout.isComputer(context))
            NeumorphicButton(
              onPressed: () {},
              padding: EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 6.0,
              ),
              child: Padding(
                padding: const EdgeInsets.all(Constants.kPadding / 2),
                child: Text("Admin Panel"),
              ),
            ),
          Spacer(),
          if (ResponsiveLayout.isComputer(context))
            ...List.generate(
              _buttonNames.length,
              (index) => TextButton(
                onPressed: () {
                  setState(() {
                    _currentSelectedButton = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(Constants.kPadding * 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _buttonNames[index],
                        style: TextStyle(
                          color: _currentSelectedButton == index
                              ? Colors.white
                              : Colors.white70,
                          fontSize: 18.0,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(Constants.kPadding / 2),
                        width: 80,
                        height: 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: _currentSelectedButton == index
                              ? LinearGradient(
                                  colors: [
                                    Constants.red,
                                    Constants.orange,
                                  ],
                                )
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.all(Constants.kPadding),
              child: Column(
                mainAxisAlignment: ResponsiveLayout.isPhone(context)
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _buttonNames[_currentSelectedButton],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(Constants.kPadding / 2),
                    width: 70,
                    height: 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Constants.red,
                          Constants.orange,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          Spacer(),
          IconButton(
            color: Colors.white,
            iconSize: 30,
            onPressed: () {},
            icon: Icon(Icons.search_rounded),
          ),
          Stack(
            children: [
              IconButton(
                color: Colors.white,
                iconSize: 30,
                onPressed: () {},
                icon: Icon(Icons.notifications_none_rounded),
              ),
              Positioned(
                right: 6,
                top: 6,
                child: CircleAvatar(
                  backgroundColor: Colors.pink,
                  radius: 8,
                  child: Text(
                    "1",
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          if (!ResponsiveLayout.isPhone(context))
            Container(
              margin: EdgeInsets.all(Constants.kPadding),
              height: double.infinity,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(0, 0),
                  spreadRadius: 1,
                  blurRadius: 10,
                )
              ], shape: BoxShape.circle),
              child: CircleAvatar(
                backgroundColor: Constants.orange,
                radius: 25,
                backgroundImage: AssetImage(
                  "images/profile.png",
                ),
              ),
            ),
        ],
      ),
    );
  }
}
