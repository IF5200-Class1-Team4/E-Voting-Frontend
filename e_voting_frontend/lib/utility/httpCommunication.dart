import 'package:http/http.dart' as http;

class HttpCommunication {
  static const BackendHostName = "example.com";
  HttpCommunication();

  Future<String> GetProfileSync() async{
    var url = Uri.https(BackendHostName);
    var response = await http.get(url, headers: {});
    return response.body;
  }
  
}