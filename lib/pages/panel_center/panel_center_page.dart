import 'dart:ui';
import 'package:admin_panel_responsive_flutter/pages/charts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../constants.dart';

class Person {
  String name;
  Color color;
  Person({required this.name, required this.color});
}

class PanelCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Person> _persons = [
      Person(name: "Larry Dunlap", color: Color(0xffff5182)),
      Person(name: "John Booker", color: Color(0xff13d38e)),
      Person(name: "William Lopez", color: Color(0xff0293ee)),
      Person(name: "Andres Navarro", color: Color(0xfff8b250)),
      Person(name: "Valerie Carson", color: Color(0xff13d38e)),
      Person(name: "Sara Casey", color: Color(0xfff8b250)),
      Person(name: "Anthony Palmer", color: Color(0xffff5182)),
      Person(name: "Kathleen Clark", color: Color(0xff0293ee)),
      Person(name: "Donald Russell", color: Color(0xff13d38e)),
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: Constants.kPadding,
                right: Constants.kPadding,
                left: Constants.kPadding,
                bottom: Constants.kPadding / 2),
            child: Card(
              color: Constants.greenLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Neumorphic(
                style: NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
                    depth: 5,
                    lightSource: LightSource.topLeft,
                    color: Constants.greenDark),
                child: Container(
                  width: double.infinity,
                  child: ListTile(
                    //leading: Icon(Icons.sell),
                    title: Text(
                      "Products Available",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "63% of Products Avail.",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Neumorphic(
                      style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(50)),
                          depth: -3,
                          lightSource: LightSource.topLeft,
                          color: Constants.greenDark),
                      child: Chip(
                        backgroundColor: Constants.greenDark,
                        label: Text(
                          "25,030",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          BarChartSample2(),
          Padding(
            padding: const EdgeInsets.only(
                top: Constants.kPadding,
                left: Constants.kPadding,
                right: Constants.kPadding,
                bottom: Constants.kPadding * 2),
            child: Card(
              color: Constants.greenDark,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Neumorphic(
                style: NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
                    depth: 5,
                    lightSource: LightSource.topLeft,
                    color: Constants.greenDark),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                  ),
                  child: Column(
                    children: List.generate(
                      _persons.length,
                      (index) => ListTile(
                        leading: Neumorphic(
                          style: NeumorphicStyle(
                              shape: NeumorphicShape.flat,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(20)),
                              depth: 4,
                              lightSource: LightSource.topLeft,
                              color: Constants.greenDark),
                          child: CircleAvatar(
                            radius: 15,
                            child: Text(
                              _persons[index].name.substring(0, 1),
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: _persons[index].color,
                          ),
                        ),
                        title: Text(
                          _persons[index].name,
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.message_outlined,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
