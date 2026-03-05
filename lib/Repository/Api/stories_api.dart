import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:instagram/Repository/Api_service/Api_client.dart';
import 'package:instagram/Repository/Model/Instagram_model.dart';
import 'package:instagram/Repository/Model/highlightStories.dart';

class StoriesApi {
  final ApiClient apiClient = ApiClient();

  Future<HighlightStoriesModel> fetchData(String id) async {
    String endpoint = "api/instagram/highlightStories";

    Response response = await apiClient.invokeAPI(endpoint, 'POST', {
      "highlightId":id
    
    });

    if (kDebugMode) {
      print("STATUS: ${response.statusCode}");
      print("BODY: ${response.body}");
    }

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      return HighlightStoriesModel.fromJson(data);
    } else {
      throw Exception(
        "Failed to load instagramscreen (${response.statusCode})",
      );
    }
  }
}
