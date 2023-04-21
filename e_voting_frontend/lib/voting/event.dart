import 'dart:convert';

import 'package:e_voting_frontend/voting/candidate.dart';
class VotingEvent {
  final String startDate;
  final String endDate;
  final List<Candidate> candidateList;
  VotingEvent(this.startDate, this.endDate, this.candidateList);

  factory VotingEvent.fromJsonString(String source) {
    var data = json.decode(source);
    print(data);
    final name = data['startDate'] as String;
    final party = data['endDate'] as String;
    var dataList = data['candidateList'] as List;
    List<Candidate> list = dataList.map<Candidate>((json) => Candidate.fromJson(json)).toList();
    return VotingEvent(name, party, list);
  }
}