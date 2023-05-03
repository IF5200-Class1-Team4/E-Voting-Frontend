import 'package:e_voting_frontend/user_role/accountProfile.dart';
import 'package:flutter/material.dart';

class ProfileSubPage extends StatelessWidget {
  final AccountProfile profile;

  const ProfileSubPage({super.key, required this.profile});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        centerTitle: true,
        elevation: 0,
      ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('user.jpg'),
                  radius: 40,
                ),
              ),
              Divider(
                height: 60,
                color: Colors.grey[800],
              ),
              const Text(
                'Name',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2
                ),
              ),
              const SizedBox(height: 10),
              Text(
                profile.name,
                style: const TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2,
                    fontSize: 28,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Date of Birth',
                style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2
                ),
              ),
              const SizedBox(height: 10),
              Text(
                profile.dateOfBirth,
                style: const TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2,
                    fontSize: 28,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Gender',
                style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2
                ),
              ),
              const SizedBox(height: 10),
              Text(
                profile.gender,
                style: const TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2,
                    fontSize: 28,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Voter ID',
                style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2
                ),
              ),
              const SizedBox(height: 10),
              Text(
                profile.id.toString(),
                style: const TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2,
                    fontSize: 28,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
    );
  }
}