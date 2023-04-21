import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:side_navigation/side_navigation.dart';
import 'package:e_voting_frontend/user_role/userRole.dart';

class SideMenuList {
  final SideMenuController page;

  static const SideNavigationBarItem _accountInfo = SideNavigationBarItem(
        icon: Icons.person,
        label: 'Account',
      );
  
  static const SideNavigationBarItem _votingOption = SideNavigationBarItem(
        icon: Icons.edit_document,
        label: 'Vote',
      );

  static const SideNavigationBarItem _votingProgression = SideNavigationBarItem(
        icon: Icons.pie_chart,
        label: 'Voting Progress',
      );

  static const SideNavigationBarItem _setVotePeriod = SideNavigationBarItem(
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

  List<SideNavigationBarItem> GetNavBarList(UserRole role){
    List<SideNavigationBarItem> items = [
      _accountInfo
    ];

    if(role == UserRole.voter){
      items.add(_votingOption);
      items.add(_votingProgression);
    }
    else if(role == UserRole.candidate){
      items.add(_votingOption);
      items.add(_votingProgression);
    }
    else if(role == UserRole.voter){
      items.add(_votingOption);
      items.add(_votingProgression);
    }

    return items;
  }

  SideMenuList(this.page);
}