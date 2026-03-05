
class Hielightsmodel {
    List<Result>? result;

    Hielightsmodel({this.result});

    Hielightsmodel.fromJson(Map<String, dynamic> json) {
        result = json["result"] == null ? null : (json["result"] as List).map((e) => Result.fromJson(e)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(result != null) {
            _data["result"] = result?.map((e) => e.toJson()).toList();
        }
        return _data;
    }
}

class Result {
    String? id;
    String? title;
    CoverMedia? coverMedia;
    User? user;

    Result({this.id, this.title, this.coverMedia, this.user});

    Result.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        title = json["title"];
        coverMedia = json["cover_media"] == null ? null : CoverMedia.fromJson(json["cover_media"]);
        user = json["user"] == null ? null : User.fromJson(json["user"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["title"] = title;
        if(coverMedia != null) {
            _data["cover_media"] = coverMedia?.toJson();
        }
        if(user != null) {
            _data["user"] = user?.toJson();
        }
        return _data;
    }
}

class User {
    String? username;
    String? id;

    User({this.username, this.id});

    User.fromJson(Map<String, dynamic> json) {
        username = json["username"];
        id = json["id"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["username"] = username;
        _data["id"] = id;
        return _data;
    }
}

class CoverMedia {
    CroppedImageVersion? croppedImageVersion;

    CoverMedia({this.croppedImageVersion});

    CoverMedia.fromJson(Map<String, dynamic> json) {
        croppedImageVersion = json["cropped_image_version"] == null ? null : CroppedImageVersion.fromJson(json["cropped_image_version"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(croppedImageVersion != null) {
            _data["cropped_image_version"] = croppedImageVersion?.toJson();
        }
        return _data;
    }
}

class CroppedImageVersion {
    String? url;
    String? urlWrapped;

    CroppedImageVersion({this.url, this.urlWrapped});

    CroppedImageVersion.fromJson(Map<String, dynamic> json) {
        url = json["url"];
        urlWrapped = json["url_wrapped"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["url"] = url;
        _data["url_wrapped"] = urlWrapped;
        return _data;
    }
}