import 'dart:convert';
import 'dart:io';


import 'package:e_voting_frontend/user_role/accountProfile.dart';
import 'package:e_voting_frontend/voting/candidate.dart';
import 'package:e_voting_frontend/voting/event.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

class HttpCommunication {
  static const backendHostName = "64.226.77.59:8000";
  String apiKey = "689g7wteqwrecihobju";
  String accessToken = ""; 

  static final HttpCommunication _instance = HttpCommunication._internal();

  factory HttpCommunication(){
    return _instance;
  }

  HttpCommunication._internal();

  AccountProfile GetProfile(){
    var decodedToken = JwtDecoder.decode(accessToken);
    return AccountProfile.fromJson(decodedToken["user"]);
  }

  Future<String?> PostLoginSync(String email, String password) async{
    var url = Uri.parse("http://64.226.77.59:8000/dummy/login");
    // var url = Uri.http("64.226.77.59:8000","dummy/login");
    // var url = Uri.https("google.com");

    Map<String, String> body = {};
    body["email"] = email;
    body["password"] = password;
    String bodyJson = json.encode(body);

    print("json data $bodyJson");

    Map<String, String> headers= {};
    headers["apikey"] = apiKey;
    headers["Content-Type"] = "application/json";

    try {
      var response = await http.post(url, headers: headers, body: bodyJson);
      print("response header ${response.headers.toString()}");
      print("response body ${response.body.toString()}");
      print("request header ${headers.toString()}");
      print("request body ${bodyJson}");
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

  Future<String?> PostRegisterSync(String email, String password, Map<String, String>additionalData) async{
    var url = Uri.http("$backendHostName/v1/register");
    // var url = Uri.https("google.com");

    Map<String, dynamic> body = {};
    body["email"] = email;
    body["password"] = password;
    body["id"] = additionalData["id"]!;
    body["name"] = additionalData["name"]!;
    // body["dateOfBirth"] = (DateTime.parse(body["dateOfBirth"]!).millisecondsSinceEpoch/1000).round();
    body["dateOfBirth"] = 0;
    body["gender"] = additionalData["gender"]!;
    String bodyJson = json.encode(body);
    print("json $bodyJson");

    Map<String, String> headers= {};
    headers["apikey"] = apiKey;

    try {
      var response = await http.post(url, headers: headers, body: bodyJson);
      if(response.statusCode != HttpStatus.ok){
        return response.statusCode.toString();
      }
      return null; 
    } catch (e) {
      return e.toString();
    }
  }

  Future<VotingEvent?> GetEventSync(int eventId) async{
    var url = Uri.parse("http://64.226.77.59:8000/dummy/event/$eventId");
    // var url = Uri.http("64.226.77.59:8000","dummy/login");
    // var url = Uri.https("google.com");

    Map<String, String> headers= {};
    headers["apikey"] = apiKey;
    headers["Authorization"] = "Bearer $accessToken";

    try {
      var response = await http.get(url, headers: headers);
      print("response header ${response.headers.toString()}");
      print("response body ${response.body.toString()}");
      print("request header ${headers.toString()}");
      if(response.statusCode != HttpStatus.ok){
        print("error code ${response.statusCode.toString()}");
        return null;
      }

      VotingEvent event = VotingEvent.fromJsonString(response.body);
      return event; 

    } catch (e) {
      print("error ${e.toString()}");
      return null;
    }
  }

  Future<VotingEvent?> PostVoteSync(int eventId, int candidateId) async{
    var url = Uri.parse("http://64.226.77.59:8000/dummy/event/$eventId/vote/$candidateId");
    // var url = Uri.http("64.226.77.59:8000","dummy/login");
    // var url = Uri.https("google.com");

    Map<String, String> headers= {};
    headers["apikey"] = apiKey;
    headers["Authorization"] = "Bearer $accessToken";

    try {
      var response = await http.post(url, headers: headers);
      print("response header ${response.headers.toString()}");
      print("response body ${response.body.toString()}");
      print("request header ${headers.toString()}");
      if(response.statusCode != HttpStatus.ok){
        print("error code ${response.statusCode.toString()}");
        return null;
      }

      VotingEvent event = VotingEvent.fromJsonString(response.body);
      print("vote success");
      return event; 
      
    } catch (e) {
      print("error ${e.toString()}");
      return null;
    }
  }
  
}