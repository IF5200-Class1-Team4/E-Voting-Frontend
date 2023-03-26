import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:side_navigation/side_navigation.dart';

class SideMenuList {
  final SideMenuController page;

  SideNavigationBarItem _accountInfo = SideNavigationBarItem(
        icon: Icons.person,
        label: 'Account',
      );
  
  SideNavigationBarItem _votingOption = SideNavigationBarItem(
        icon: Icons.edit_document,
        label: 'Vote',
      );

  SideNavigationBarItem _votingProgression = SideNavigationBarItem(
        icon: Icons.pie_chart,
        label: 'Voting Progress',
      );

  SideNavigationBarItem _setVotePeriod = SideNavigationBarItem(
        icon: Icons.pie_chart,
        label: 'Set Vote Period',
      );

  List<SideNavigationBarItem> items = const [
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
];

  SideMenuList(this.page);
}