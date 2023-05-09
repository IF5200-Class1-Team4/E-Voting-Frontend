import 'dart:convert';
import 'dart:io';


import 'package:e_voting_frontend/user_role/accountProfile.dart';
import 'package:e_voting_frontend/voting/candidate.dart';
import 'package:e_voting_frontend/voting/event.dart';
import 'package:http/http.dart' as http;

class HttpCommunication {
  static const backendHostName = "hostname.ac.id";
  String apiKey = "689g7wteqwrecihobju";
  String accessToken = ""; 

  static final HttpCommunication _instance = HttpCommunication._internal();

  factory HttpCommunication(){
    return _instance;
  }

  HttpCommunication._internal();

  Future<String> GetProfileSync() async{
    var url = Uri.https(backendHostName);
    var response = await http.get(url, headers: {});
    return response.body;
  }

  Future<String?> PostLoginSync(String email, String password) async{
    var url = Uri.https("google.com");

    Map<String, String> body = {};
    body["email"] = email;
    body["password"] = password;
    String bodyJson = json.encode(body);

    print("json data $bodyJson");

    Map<String, String> headers= {};
    headers["apikey"] = apiKey;

    try {
      var response = await http.post(url, headers: headers, body: bodyJson);
      if(response.statusCode != HttpStatus.ok){
        return response.statusCode.toString();
      }

      var data = json.decode(response.body);
      accessToken = data["access_token"];

      return null; 
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> PostRegisterSync(String email, String password) async{
    var url = Uri.https("$backendHostName/v1/register");

    Map<String, String> body = {};
    body["email"] = email;
    body["password"] = password;
    String bodyJson = json.encode(body);

    Map<String, String> headers= {};
    headers["apikey"] = apiKey;

    var response = await http.post(url, headers: headers, body: bodyJson);
    if(response.statusCode != HttpStatus.ok){
      return null;
    }

    var data = json.decode(response.body);
    accessToken = data["access_token"];

    return accessToken;
  }

  //PostSelectedCandidate
  //GetVotingEvent
  //GetVotingProgression
  
}