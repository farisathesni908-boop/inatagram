
class InstagramProfileModel {
    Result? result;

    InstagramProfileModel({this.result});

    InstagramProfileModel.fromJson(Map<String, dynamic> json) {
        result = json["result"] == null ? null : Result.fromJson(json["result"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(result != null) {
            _data["result"] = result?.toJson();
        }
        return _data;
    }
}

class Result {
    String? id;
    String? username;
    bool? isPrivate;
    String? profilePicUrl;
    String? profilePicUrlHd;
    String? biography;
    String? fullName;
    EdgeOwnerToTimelineMedia? edgeOwnerToTimelineMedia;
    EdgeFollowedBy? edgeFollowedBy;
    EdgeFollow? edgeFollow;
    String? profilePicUrlWrapped;
    String? profilePicUrlHdWrapped;

    Result({this.id, this.username, this.isPrivate, this.profilePicUrl, this.profilePicUrlHd, this.biography, this.fullName, this.edgeOwnerToTimelineMedia, this.edgeFollowedBy, this.edgeFollow, this.profilePicUrlWrapped, this.profilePicUrlHdWrapped});

    Result.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        username = json["username"];
        isPrivate = json["is_private"];
        profilePicUrl = json["profile_pic_url"];
        profilePicUrlHd = json["profile_pic_url_hd"];
        biography = json["biography"];
        fullName = json["full_name"];
        edgeOwnerToTimelineMedia = json["edge_owner_to_timeline_media"] == null ? null : EdgeOwnerToTimelineMedia.fromJson(json["edge_owner_to_timeline_media"]);
        edgeFollowedBy = json["edge_followed_by"] == null ? null : EdgeFollowedBy.fromJson(json["edge_followed_by"]);
        edgeFollow = json["edge_follow"] == null ? null : EdgeFollow.fromJson(json["edge_follow"]);
        profilePicUrlWrapped = json["profile_pic_url_wrapped"];
        profilePicUrlHdWrapped = json["profile_pic_url_hd_wrapped"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["username"] = username;
        _data["is_private"] = isPrivate;
        _data["profile_pic_url"] = profilePicUrl;
        _data["profile_pic_url_hd"] = profilePicUrlHd;
        _data["biography"] = biography;
        _data["full_name"] = fullName;
        if(edgeOwnerToTimelineMedia != null) {
            _data["edge_owner_to_timeline_media"] = edgeOwnerToTimelineMedia?.toJson();
        }
        if(edgeFollowedBy != null) {
            _data["edge_followed_by"] = edgeFollowedBy?.toJson();
        }
        if(edgeFollow != null) {
            _data["edge_follow"] = edgeFollow?.toJson();
        }
        _data["profile_pic_url_wrapped"] = profilePicUrlWrapped;
        _data["profile_pic_url_hd_wrapped"] = profilePicUrlHdWrapped;
        return _data;
    }
}

class EdgeFollow {
    int? count;

    EdgeFollow({this.count});

    EdgeFollow.fromJson(Map<String, dynamic> json) {
        count = json["count"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["count"] = count;
        return _data;
    }
}

class EdgeFollowedBy {
    int? count;

    EdgeFollowedBy({this.count});

    EdgeFollowedBy.fromJson(Map<String, dynamic> json) {
        count = json["count"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["count"] = count;
        return _data;
    }
}

class EdgeOwnerToTimelineMedia {
    int? count;

    EdgeOwnerToTimelineMedia({this.count});

    EdgeOwnerToTimelineMedia.fromJson(Map<String, dynamic> json) {
        count = json["count"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["count"] = count;
        return _data;
    }
}