import 'dart:convert';
class Candidate {
  final String name;
  final String party;
  final int votes;
  final int id;
  Candidate(this.name, this.party, this.votes, this.id);

  factory Candidate.fromJsonString(String source) {
    var data = jsonDecode(source);
    print(data);
    final name = data['name'] as String;
    final party = data['party'] as String;
    final id = data['id'] as int;
    final votes = data['votes'] as int;
    return Candidate(name, party, votes, id);
  }

  factory Candidate.fromJson(Map<String, dynamic> data) {
    print(data);
    final name = data['name'] as String;
    final party = data['party'] as String;
    final id = data['id'] as int;
    final votes = data['votes'] as int;
    return Candidate(name, party, votes, id);
  }
}