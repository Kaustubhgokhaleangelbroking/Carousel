import 'dart:convert';

import 'package:http/http.dart' as http;

import './api_client_endpoint.dart';

class ApiClient {
  String host;
  static final ApiClient _apiClient = ApiClient._internal();
  //name constructor
  ApiClient._internal() {
    host = ApiEndPoint.baseUrl;
  }

  // facotry -> It wont create new instance rather returns existing instance
  /*
  In normal constructor, an instance gets created and the final variables get instantiated with the initializer list. This is why there's no return statement. The instance to return is already fixed, when executing the constructor!
  In a factory constructor, the instance to return is decided by the method. That's why it needs a return statement and why it'll usually call a normal constructor in at least one path.
  */
  factory ApiClient() {
    return _apiClient;
  }

  dynamic get(String path) async {
    var url = getParsedUrl(path);
    print(url);
    final response = await http.get(url);
    return json.decode(response.body);
  }

  //Uri it tries converts string to url
  Uri getParsedUrl(String path) {
    return Uri.parse('$host$path');
  }
}
