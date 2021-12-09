import 'package:admin_panel_responsive_flutter/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../constants.dart';
import '../charts.dart';

class Todo {
  String name;
  bool enable;
  Todo({this.enable = true, required this.name});
}

class PanelLeftPage extends StatefulWidget {
  @override
  _PanelLeftPageState createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelLeftPage> {
  List<Todo> _todos = [
    Todo(name: "Staff Meeting", enable: false),
    Todo(name: "Client Meeting", enable: false),
    Todo(name: "Hiring interview", enable: true),
    Todo(name: "Maketing Strategy", enable: true),
    Todo(name: "Performance review", enable: false),
    Todo(name: "Presentation", enable: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (ResponsiveLayout.isComputer(context))
            Container(
              color: Constants.purpleLight,
              width: 50,
              child: Container(
                decoration: BoxDecoration(
                  color: Constants.purpleDark,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                  ),
                ),
              ),
            ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: Constants.kPadding,
                      top: Constants.kPadding,
                      right: Constants.kPadding,
                      bottom: Constants.kPadding / 2),
                  child: Card(
                    color: Constants.greenLight,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Neumorphic(
                      style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(50)),
                          depth: 5,
                          lightSource: LightSource.topLeft,
                          color: Constants.greenDark),
                      child: Container(
                        width: double.infinity,
                        child: ListTile(
                          //leading: Icon(Icons.shopping_basket),
                          title: Text(
                            "Products Sold",
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            "37% of Products Sold",
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
                                "14,700",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                LineChartSample2(),
                // PieChartSample2(),
                Padding(
                  padding: const EdgeInsets.only(
                      right: Constants.kPadding,
                      bottom: Constants.kPadding * 2,
                      top: Constants.kPadding,
                      left: Constants.kPadding),
                  child: Card(
                    color: Constants.purpleLight,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Neumorphic(
                      style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(20)),
                          depth: 5,
                          lightSource: LightSource.topLeft,
                          color: Constants.greenDark),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: List.generate(
                            _todos.length,
                            (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _todos[index].name,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  NeumorphicCheckbox(
                                    style: NeumorphicCheckboxStyle(
                                      selectedColor: Constants.leftBarEnd,
                                      selectedDepth: 1,
                                      unselectedDepth: 3,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                      vertical: 6.0,
                                    ),
                                    value: _todos[index].enable,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _todos[index].enable = newValue ?? true;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
