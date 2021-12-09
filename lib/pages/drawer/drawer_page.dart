import 'package:admin_panel_responsive_flutter/constants.dart';
import 'package:admin_panel_responsive_flutter/responsive_layout.dart';
import 'package:flutter/material.dart';

class ButtonsInfo {
  String title;
  IconData icon;

  ButtonsInfo({required this.title, required this.icon});
}

class Task {
  String task;
  double taskValue;
  Color color;

  Task({required this.task, required this.taskValue, required this.color});
}

int _currentIndex = 0;

List<ButtonsInfo> _buttonNames = [
  ButtonsInfo(title: "Home", icon: Icons.home_rounded),
  ButtonsInfo(title: "Notifications", icon: Icons.notifications_rounded),
  ButtonsInfo(title: "Contacts", icon: Icons.contact_phone_rounded),
  ButtonsInfo(title: "Sales", icon: Icons.sell_rounded),
  ButtonsInfo(title: "Marketing", icon: Icons.mark_email_read_rounded),
  ButtonsInfo(title: "Settings", icon: Icons.settings_rounded),
  ButtonsInfo(title: "Profile", icon: Icons.person_rounded),
];

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Constants.greenLight),
      child: Drawer(
        elevation: 0,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Constants.kPadding * 4),
            child: Column(
              children: [
                SizedBox(height: 10,),
                ListTile(
                  title: Text(
                    "Admin Menu",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  trailing: !ResponsiveLayout.isComputer(context)
                      ? IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.close_rounded, color: Colors.white),
                        )
                      : null,
                ),
                ...List.generate(
                  _buttonNames.length,
                  (index) => Column(
                    children: [
                      Container(
                        decoration: index == _currentIndex
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  colors: [
                                    Constants.red.withOpacity(0.9),
                                    Constants.orange.withOpacity(0.9),
                                  ],
                                ),
                              )
                            : null,
                        child: ListTile(
                          title: Text(
                            _buttonNames[index].title,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          leading: Padding(
                            padding: const EdgeInsets.all(Constants.kPadding),
                            child: Icon(
                              _buttonNames[index].icon,
                              color: Colors.white,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: 0.1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}