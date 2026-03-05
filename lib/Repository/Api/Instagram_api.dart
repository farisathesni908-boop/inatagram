import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:instagram/Repository/Api_service/Api_client.dart';
import 'package:instagram/Repository/Model/Instagram_model.dart';

class InstagramApi {
  final ApiClient apiClient = ApiClient();

  Future<InstagramModel> fetchData(String user) async {
    String endpoint = "api/instagram/posts";

    Response response = await apiClient.invokeAPI(endpoint, 'POST', {
      "username": user,
      "maxId": "",
    });

    if (kDebugMode) {
      print("STATUS: ${response.statusCode}");
      print("BODY: ${response.body}");
    }

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      return InstagramModel.fromJson(data);
    } else {
      throw Exception(
        "Failed to load instagramscreen (${response.statusCode})",
      );
    }
  }
}
