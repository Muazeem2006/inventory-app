// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:http/http.dart' as http;


String host = '192.168.8.100'; //AphzolVirusMesh
// String host = '192.168.91.123'; //Godswill A04
String port = '4000';
String authority = "$host:$port";

Map<String, String> headers = {'X-Flutter-App': 'inventory_mgt_app'};

Future<http.Response> get(path,
    [Map<String, dynamic>? data, int timeout = 5]) async {
  var url = Uri.http(authority, path, data);
  print(url);
  return http.get(url, headers: headers).timeout(Duration(seconds: timeout));
}

Future<http.Response> post(path,
    [Map<String, dynamic>? data, int timeout = 5]) async {
  var url = Uri.http(authority, path);
  print(data);
  return http
      .post(url, body: data, headers: headers)
      .timeout(Duration(seconds: timeout));
}
