import 'package:admin_panel_responsive_flutter/constants.dart';
import 'package:admin_panel_responsive_flutter/pages/charts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Product {
  String name;
  bool enable;
  Product({this.enable = true, required this.name});
}

class PanelRightPage extends StatefulWidget {
  @override
  _PanelRightPageState createState() => _PanelRightPageState();
}

class _PanelRightPageState extends State<PanelRightPage> {
  List<Product> _products = [
    Product(name: "Net sales", enable: true),
    Product(name: "Cost of sales", enable: true),
    Product(name: "Gross margin", enable: false),
    Product(name: "Operating expenses", enable: false),
    Product(name: "Operating income", enable: false),
    Product(name: "Other income", enable: true),
    Product(name: "Provisions", enable: false),
    Product(name: "Net income", enable: true),
    Product(name: "Earnings", enable: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: Constants.kPadding,
                top: Constants.kPadding,
                left: Constants.kPadding,
                bottom: Constants.kPadding / 2,
              ),
              child: Card(
                color: Constants.greenDark,
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
                      //leading: Icon(Icons.monetization_on),
                      title: Text(
                        "Net Revenue",
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        "9% of Sales Avg.",
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
                            r"$73,290",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            LineChartSample1(),
            PieChartSample2(),
            Padding(
              padding: const EdgeInsets.only(
                  right: Constants.kPadding,
                  bottom: Constants.kPadding * 2,
                  top: Constants.kPadding,
                  left: Constants.kPadding),
              child: Card(
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
                        _products.length,
                        (index) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                              ),
                              child: Text(
                                _products[index].name,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(Constants.kPadding),
                              child: SizedBox(
                                height: 25,
                                child: NeumorphicSwitch(
                                  value: _products[index].enable,
                                  style: NeumorphicSwitchStyle(trackDepth: 4),
                                  onChanged: (value) {
                                    setState(() {
                                      _products[index].enable = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
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
    );
  }
}
