import 'dart:convert';

class AccountProfile {
  final String name;
  final String dateOfBirth;
  final String gender;
  final int id;
  AccountProfile(this.name, this.dateOfBirth, this.gender, this.id);

  factory AccountProfile.fromJsonString(String source) {
    var data = jsonDecode(source);
    print(data);
    final name = data['name'] as String;
    final dateOfBirth = data['dateOfBirth'] as String;
    final gender = data['gender'] as String;
    final id = data['id'] as int;
    return AccountProfile(name, dateOfBirth, gender, id);
  }

  factory AccountProfile.fromJson(Map<String, dynamic> data) {
    print(data);
    final name = data['name'] as String;
    final dateOfBirth = data['dateOfBirth'] as String;
    final gender = data['gender'] as String;
    final id = data['id'] as int;
    return AccountProfile(name, dateOfBirth, gender, id);
  }
}