import 'package:http/http.dart' as http;

class HttpCommunication {
  static const BackendHostName = "example.com";
  HttpCommunication();
  String apiKey = "adsadsadasdsad";
  String accessToken = ""; 

  Future<String> GetProfileSync() async{
    var url = Uri.https(BackendHostName);
    var response = await http.get(url, headers: {});
    return response.body;
  }

  Future<String> PostLoginSync() async{
    var url = Uri.https(BackendHostName);
    var response = await http.get(url, headers: {});
    accessToken = response.body;
    return response.body;
  }

  //PostSelectedCandidate
  //GetVotingEvent
  //GetVotingProgression
  
}