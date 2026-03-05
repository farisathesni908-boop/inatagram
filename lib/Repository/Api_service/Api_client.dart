import 'dart:convert';
import 'dart:developer';




import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:instagram/Repository/Api_service/Api_exception.dart';
import 'package:instagram/main.dart';



class ApiClient {

  Future<http.Response> invokeAPI(
      String path, String method, Object? body) async {
 

    String url = basePath + path;
    if (kDebugMode) {
      print(url);
    }
 
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      // 'authorization': 'Bearer $token',
      "x-rapidapi-host":'instagram120.p.rapidapi.com',
      'x-rapidapi-key':'b7fdb7d435msh89b1f37285d7ae0p12a1e3jsnb4c5a91a15ad'
    };

    http.Response response;

    switch (method) {
      case "POST":
        response = await http.post(Uri.parse(url),
            headers: headers, body: jsonEncode(body));
        break;
      case "PUT":
        response = await http.put(Uri.parse(url),
            headers: headers, body: jsonEncode(body));
        break;
      case "DELETE":
        response = await http.delete(Uri.parse(url),
            headers: headers, body: jsonEncode(body));
        break;
      case "GET":
        // Handling GET with body
        final request = http.Request(
          'GET',
          Uri.parse(url),
        );
        request.headers.addAll(headers);

        final streamedResponse = await request.send();
        response = await http.Response.fromStream(streamedResponse);
        break;
      case "PATCH":
        response = await http.patch(Uri.parse(url),
            headers: headers, body: jsonEncode(body));
        break;
      default:
        response = await http.get(Uri.parse(url), headers: headers);
    }

    if (kDebugMode) {
      print('status of $path => ${response.statusCode}');
    }
    if (kDebugMode) {
      print(response.body);
    }

    if (response.statusCode >= 400) {
      log('$path : ${response.statusCode} : ${response.body}');
      throw ApiException(_decodeBodyBytes(response), response.statusCode);
    }

    return response;
  }

String _decodeBodyBytes(http.Response response) {
  var contentType = response.headers['content-type'];
  if (contentType != null && contentType.contains("application/json")) {
    try {
      final bodyJson = jsonDecode(response.body) as Map<String, dynamic>;

      if (bodyJson.containsKey('message') && bodyJson['message'] is String) {
        return bodyJson['message'];
      }
      
      if (bodyJson.containsKey('error') && bodyJson['error'] is String) {
        return bodyJson['error'];
      }
      return response.body;
    } catch (e) {
      return response.body;
    }
  } else {
    return response.body;
  }
}
}
