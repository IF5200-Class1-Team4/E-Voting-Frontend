import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';

class SideMenuList {
  final SideMenuController page;

  List<SideMenuItem> items = const [
  SideMenuItem(
    priority: 0,
    title: 'Dashboard',
    // onTap: () => page.changePage(0, page),
    icon: Icon(Icons.home),
    badgeContent: Text(
      '3',
      style: TextStyle(color: Colors.white),
    ),
  ),
  SideMenuItem(
    priority: 1,
    title: 'Settings',
    // onTap: () => page.jumpToPage(1),
    icon: Icon(Icons.settings),
  ),
  SideMenuItem(
    priority: 2,
    title: 'Exit',
    // onTap: () {},
    icon: Icon(Icons.exit_to_app),
  ),
];

  SideMenuList(this.page);
}