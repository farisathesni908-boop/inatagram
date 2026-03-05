class HighlightStoriesModel {
  List<Result>? result;

  HighlightStoriesModel({this.result});

  HighlightStoriesModel.fromJson(Map<String, dynamic> json) {
    result = json["result"] == null
        ? null
        : (json["result"] as List).map((e) => Result.fromJson(e)).toList();
  }
}

class Result {
  ImageVersions2? imageVersions2;
  int? originalHeight;
  int? originalWidth;
  String? pk;
  int? takenAt;
  List<VideoVersions>? videoVersions;
  bool? hasAudio;
  User? user;

  Result.fromJson(Map<String, dynamic> json) {
    imageVersions2 = json["image_versions2"] == null
        ? null
        : ImageVersions2.fromJson(json["image_versions2"]);
    // Using (value as num?)?.toInt() prevents the Double to Int error
    originalHeight = (json["original_height"] as num?)?.toInt();
    originalWidth = (json["original_width"] as num?)?.toInt();
    pk = json["pk"]?.toString();
    takenAt = (json["taken_at"] as num?)?.toInt();
    videoVersions = json["video_versions"] == null
        ? null
        : (json["video_versions"] as List)
            .map((e) => VideoVersions.fromJson(e))
            .toList();
    hasAudio = json["has_audio"];
    user = json["user"] == null ? null : User.fromJson(json["user"]);
  }
}

class User {
  String? id;
  String? username;
  bool? isPrivate;
  String? profilePicUrl;

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toString();
    username = json["username"];
    isPrivate = json["is_private"];
    profilePicUrl = json["profile_pic_url"];
  }
}

class VideoVersions {
  int? height;
  int? type;
  String? url;
  int? width;

  VideoVersions.fromJson(Map<String, dynamic> json) {
    height = (json["height"] as num?)?.toInt();
    type = (json["type"] as num?)?.toInt();
    url = json["url"];
    width = (json["width"] as num?)?.toInt();
  }
}

class ImageVersions2 {
  List<Candidates>? candidates;
  ImageVersions2.fromJson(Map<String, dynamic> json) {
    candidates = json["candidates"] == null
        ? null
        : (json["candidates"] as List).map((e) => Candidates.fromJson(e)).toList();
  }
}

class Candidates {
  int? height;
  String? url;
  int? width;

  Candidates.fromJson(Map<String, dynamic> json) {
    height = (json["height"] as num?)?.toInt();
    url = json["url"];
    width = (json["width"] as num?)?.toInt();
  }
}