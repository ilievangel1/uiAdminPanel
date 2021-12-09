import 'package:admin_panel_responsive_flutter/constants.dart';
import 'package:admin_panel_responsive_flutter/widget_tree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Panel',
      themeMode: ThemeMode.dark,
      theme: NeumorphicThemeData(
        baseColor: Color(0xFFFFFFFF),
        lightSource: LightSource.topLeft,
        depth: 10,
      ),
      darkTheme: NeumorphicThemeData(
        baseColor: Constants.greenDark,
        lightSource: LightSource.topLeft,
        depth: 6,
        shadowDarkColor: Constants.greenShadow,
        shadowLightColor: Constants.greenLighter,
        // shadowDarkColorEmboss: Constants.orangeAccentDark,
        // shadowLightColorEmboss: Constants.orangeAccentLight,
        shadowDarkColorEmboss: Constants.greenShadow,
        shadowLightColorEmboss: Constants.greenLighter,
        // accentColor: Constants.orangeAccent,
        accentColor: Constants.leftBarEnd,
      ),
      home: WidgetTree(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Admin Panel',
//       theme: ThemeData(
//           scaffoldBackgroundColor: Constants.purpleDark,
//           primarySwatch: Colors.blue,
//           canvasColor: Constants.purpleLight),
//       home: WidgetTree(),
//     );
//   }
// }
