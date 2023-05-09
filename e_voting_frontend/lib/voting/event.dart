import 'dart:convert';

import 'package:e_voting_frontend/voting/candidate.dart';
class VotingEvent {
  final String startDate;
  final String endDate;
  final String name;
  final int id;
  final List<Candidate> candidateList;
  VotingEvent(this.startDate, this.endDate, this.name, this.id, this.candidateList);

  factory VotingEvent.fromJsonString(String source) {
    var data = json.decode(source);
    print(data);
    final start = data['startDate'].toString();
    final end = data['endDate'].toString();
    final name = data['name'] as String;
    final id = data['id'] as int;
    var dataList = data['candidates'] as List;
    List<Candidate> list = dataList.map<Candidate>((json) => Candidate.fromJson(json)).toList();
    return VotingEvent(start, end, name, id, list);
  }
}