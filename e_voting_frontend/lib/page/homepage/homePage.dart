import 'package:e_voting_frontend/page/homepage/profileSubPage.dart';
import 'package:e_voting_frontend/page/homepage/progressionSubPage.dart';
import 'package:e_voting_frontend/page/homepage/settingSubPage.dart';
import 'package:e_voting_frontend/page/homepage/sideMenuList.dart';
import 'package:e_voting_frontend/user_role/accountProfile.dart';
import 'package:e_voting_frontend/voting/event.dart';
import 'package:e_voting_frontend/page/homepage/voteSubPage.dart';
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
  String eventJsonString = "{\"startDate\":\"Tue, 2 May 2023\",\"endDate\":\"Fri, 5 May 2023\",\"name\":\"Pemilu Raya\",\"id\":123,\"candidateList\":[{\"name\":\"Budi Prakoso\",\"party\":\"Partai Pertanian Sejahtera\",\"id\":1,\"votes\":100},{\"name\":\"Abdul Archam\",\"party\":\"Partai Perminyakan\",\"id\":2,\"votes\":120}]}";
  String profileJsonString = "{\"name\":\"Budi\",\"dateOfBirth\":\"Fri, 5 May 2023\",\"gender\":\"male\",\"id\":1234}";
  late VotingEvent event;
  late AccountProfile profile;

  late List<Widget> views = [
    ProfileSubPage(profile: profile),
    VoteSubPage(event: event),
    const Center(
      child: Text('Progress'),
    ),
  ];

  _HomePageState(){
    event = VotingEvent.fromJsonString(eventJsonString);
    profile = AccountProfile.fromJsonString(profileJsonString);
  }

  // void parser(){
  //   String jsonString = "{\"startDate\":\"April\",\"endDate\":\"April\",\"candidateList\":[{\"name\":\"A\",\"party\":\"B\",\"id\":1},{\"name\":\"A2\",\"party\":\"B\",\"id\":2}]}";
  //   event = VotingEvent.fromJsonString(jsonString);
  //   if(event != null){
  //     print(event?.startDate);
  //     print(event?.endDate);
  //     print(event?.candidateList[0].id);
  //     print(event?.candidateList[0].name);
  //     print(event?.candidateList[0].party);
  //     print(event?.candidateList[1].id);
  //     print(event?.candidateList[1].name);
  //     print(event?.candidateList[1].party); 
  //   }
  // }

  Widget PageSelector(){
    switch (selectedIndex) {
      case 0:
        return ProfileSubPage(profile: profile);
      case 1:
        // return VoteSubPage(event: event);
        return electionSettingPage();
      // case 2:
      //   return ProgressionSubPage(event: event);
      default:
        return Row(children: [],);
    }
  }


  @override
  Widget build(BuildContext context) {
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
                icon: Icons.person,
                label: 'Account',
              ),
              SideNavigationBarItem(
                icon: Icons.how_to_vote,
                label: 'Vote',
              ),
              SideNavigationBarItem(
                icon: Icons.auto_graph,
                label: 'Progression',
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
          Expanded(child: PageSelector()),
        ]
      ),
      // floatingActionButton: FloatingActionButton(onPressed: parser),
      );
  }
}
