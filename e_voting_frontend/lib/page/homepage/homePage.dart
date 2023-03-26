import 'package:e_voting_frontend/page/homepage/sideMenuList.dart';
import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:side_navigation/side_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  SideMenuController page = SideMenuController();
  late final SideMenuList itemList;


  @override
  Widget build(BuildContext context) {
    itemList  = SideMenuList(page);
    return Scaffold(
      /// You can use an AppBar if you want to
      //appBar: AppBar(
      //  title: const Text('App'),
      //),

      // The row is needed to display the current view
      body: Row(
        children: [
          /// Pretty similar to the BottomNavigationBar!
          SideNavigationBar(
            selectedIndex: selectedIndex,
            items: const [
              SideNavigationBarItem(
                icon: Icons.dashboard,
                label: 'Dashboard',
              ),
              SideNavigationBarItem(
                icon: Icons.person,
                label: 'Account',
              ),
              SideNavigationBarItem(
                icon: Icons.settings,
                label: 'Settings',
              ),
            ],
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),

          const VerticalDivider(
            width: 20,
            thickness: 1,
            indent: 20,
            endIndent: 0,
            color: Colors.grey,
          ),

          /// Make it take the rest of the available width
          Expanded(child: Row(),),
        ]
      )
      );
  }
}
