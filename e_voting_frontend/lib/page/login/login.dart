import 'package:e_voting_frontend/page/homepage/homePage.dart';
import 'package:e_voting_frontend/utility/httpCommunication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
// import 'dashboard_screen.dart';

class LoginPage extends StatelessWidget {
  final HttpCommunication http = HttpCommunication();
  LoginPage({super.key});

  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) async{
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return http.PostLoginSync(data.name, data.password);
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}, data1: ${data.additionalSignupData.toString()}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String?> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'ECORP',
      onLogin: _authUser,
      onSignup: _signupUser,
      additionalSignupFields: const[
                                UserFormField(keyName: "name",
                                displayName: "Nama"),
                                UserFormField(keyName: "id",
                                displayName: "NIK"),
                                UserFormField(keyName: "dateOfBirth",
                                displayName: "Tanggal Lahir"),
                              ],
      onSubmitAnimationCompleted: () {
        Navigator.push(context, MaterialPageRoute(builder: (context){
            return const HomePage(title: "");
          })); 
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}