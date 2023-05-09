import 'dart:convert';

class AccountProfile {
  final String email;
  final String name;
  final String dateOfBirth;
  final String gender;
  final String role;
  final int id;
  AccountProfile(this.email, this.name, this.dateOfBirth, this.gender, this.role, this.id);

  factory AccountProfile.fromJsonString(String source) {
    var data = jsonDecode(source);
    print(data);
    final email = data['email'] as String;
    final name = data['name'] as String;
    final dateOfBirth = data['dateOfBirth'].toString();
    final gender = data['gender'] as String;
    final role = data['role'] as String;
    final id = data['id'] as int;
    return AccountProfile(email, name, dateOfBirth, gender, role, id);
  }

  factory AccountProfile.fromJson(Map<String, dynamic> data) {
    print(data);
    final id = data['id'] as int;
    final email = data['email'] as String;
    final name = data['name'] as String;
    final dateOfBirth = data['dateOfBirth'].toString();
    final gender = data['gender'] as String;
    final role = data['role'] as String;
    
    return AccountProfile(email, name, dateOfBirth, gender, role, id);
  }
}