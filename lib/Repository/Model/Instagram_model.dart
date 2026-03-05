
class InstagramModel {
    Result? result;

    InstagramModel({this.result});

    InstagramModel.fromJson(Map<String, dynamic> json) {
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
    List<Edges>? edges;
    PageInfo? pageInfo;
    String? version;

    Result({this.edges, this.pageInfo, this.version});

    Result.fromJson(Map<String, dynamic> json) {
        edges = json["edges"] == null ? null : (json["edges"] as List).map((e) => Edges.fromJson(e)).toList();
        pageInfo = json["page_info"] == null ? null : PageInfo.fromJson(json["page_info"]);
        version = json["version"];
    }

  get imageVersions2 => null;

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(edges != null) {
            _data["edges"] = edges?.map((e) => e.toJson()).toList();
        }
        if(pageInfo != null) {
            _data["page_info"] = pageInfo?.toJson();
        }
        _data["version"] = version;
        return _data;
    }
}

class PageInfo {
    String? endCursor;
    bool? hasNextPage;
    bool? hasPreviousPage;
    dynamic startCursor;

    PageInfo({this.endCursor, this.hasNextPage, this.hasPreviousPage, this.startCursor});

    PageInfo.fromJson(Map<String, dynamic> json) {
        endCursor = json["end_cursor"];
        hasNextPage = json["has_next_page"];
        hasPreviousPage = json["has_previous_page"];
        startCursor = json["start_cursor"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["end_cursor"] = endCursor;
        _data["has_next_page"] = hasNextPage;
        _data["has_previous_page"] = hasPreviousPage;
        _data["start_cursor"] = startCursor;
        return _data;
    }
}

class Edges {
    Node? node;
    String? cursor;

    Edges({this.node, this.cursor});

    Edges.fromJson(Map<String, dynamic> json) {
        node = json["node"] == null ? null : Node.fromJson(json["node"]);
        cursor = json["cursor"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(node != null) {
            _data["node"] = node?.toJson();
        }
        _data["cursor"] = cursor;
        return _data;
    }
}

class Node {
    String? code;
    String? pk;
    String? id;
    dynamic adId;
    dynamic boostedStatus;
    dynamic boostUnavailableIdentifier;
    dynamic boostUnavailableReason;
    Caption? caption;
    bool? captionIsEdited;
    dynamic feedDemotionControl;
    dynamic feedRecsDemotionControl;
    int? takenAt;
    dynamic inventorySource;
    List<VideoVersions>? videoVersions;
    int? isDashEligible;
    int? numberOfQualities;
    String? videoDashManifest;
    ImageVersions2? imageVersions2;
    SharingFrictionInfo? sharingFrictionInfo;
    bool? isPaidPartnership;
    dynamic sponsorTags;
    dynamic affiliateInfo;
    int? originalHeight;
    int? originalWidth;
    String? organicTrackingToken;
    dynamic link;
    dynamic storyCta;
    User? user;
    dynamic group;
    Owner? owner;
    List<dynamic>? coauthorProducers;
    List<dynamic>? invitedCoauthorProducers;
    dynamic followHashtagInfo;
    dynamic title;
    int? commentCount;
    dynamic commentsDisabled;
    dynamic commentingDisabledForViewer;
    bool? likeAndViewCountsDisabled;
    bool? hasLiked;
    List<dynamic>? topLikers;
    List<dynamic>? facepileTopLikers;
    int? likeCount;
    dynamic preview;
    bool? canSeeInsightsAsBrand;
    dynamic socialContext;
    dynamic viewCount;
    dynamic canReshare;
    bool? canViewerReshare;
    bool? igMediaSharingDisabled;
    dynamic photoOfYou;
    String? productType;
    int? mediaType;
    dynamic usertags;
    dynamic mediaOverlayInfo;
    dynamic carouselParentId;
    dynamic carouselMediaCount;
    dynamic carouselMedia;
    dynamic location;
    bool? hasAudio;
    ClipsMetadata? clipsMetadata;
    dynamic clipsAttributionInfo;
    dynamic accessibilityCaption;
    dynamic audience;
    dynamic displayUri;
    dynamic mediaCroppingInfo;
    String? profileGridThumbnailFittingStyle;
    dynamic thumbnails;
    List<String>? timelinePinnedUserIds;
    dynamic upcomingEvent;
    dynamic loggingInfoToken;
    dynamic explore;
    dynamic mainFeedCarouselStartingMediaId;
    dynamic isSeen;
    dynamic openCarouselSubmissionState;
    dynamic previousSubmitter;
    dynamic allPreviousSubmitters;
    dynamic headline;
    dynamic comments;
    int? fbLikeCount;
    dynamic savedCollectionIds;
    dynamic hasViewerSaved;
    dynamic mediaLevelCommentControls;
    String? typename;

    Node({this.code, this.pk, this.id, this.adId, this.boostedStatus, this.boostUnavailableIdentifier, this.boostUnavailableReason, this.caption, this.captionIsEdited, this.feedDemotionControl, this.feedRecsDemotionControl, this.takenAt, this.inventorySource, this.videoVersions, this.isDashEligible, this.numberOfQualities, this.videoDashManifest, this.imageVersions2, this.sharingFrictionInfo, this.isPaidPartnership, this.sponsorTags, this.affiliateInfo, this.originalHeight, this.originalWidth, this.organicTrackingToken, this.link, this.storyCta, this.user, this.group, this.owner, this.coauthorProducers, this.invitedCoauthorProducers, this.followHashtagInfo, this.title, this.commentCount, this.commentsDisabled, this.commentingDisabledForViewer, this.likeAndViewCountsDisabled, this.hasLiked, this.topLikers, this.facepileTopLikers, this.likeCount, this.preview, this.canSeeInsightsAsBrand, this.socialContext, this.viewCount, this.canReshare, this.canViewerReshare, this.igMediaSharingDisabled, this.photoOfYou, this.productType, this.mediaType, this.usertags, this.mediaOverlayInfo, this.carouselParentId, this.carouselMediaCount, this.carouselMedia, this.location, this.hasAudio, this.clipsMetadata, this.clipsAttributionInfo, this.accessibilityCaption, this.audience, this.displayUri, this.mediaCroppingInfo, this.profileGridThumbnailFittingStyle, this.thumbnails, this.timelinePinnedUserIds, this.upcomingEvent, this.loggingInfoToken, this.explore, this.mainFeedCarouselStartingMediaId, this.isSeen, this.openCarouselSubmissionState, this.previousSubmitter, this.allPreviousSubmitters, this.headline, this.comments, this.fbLikeCount, this.savedCollectionIds, this.hasViewerSaved, this.mediaLevelCommentControls, this.typename});

    Node.fromJson(Map<String, dynamic> json) {
        code = json["code"];
        pk = json["pk"];
        id = json["id"];
        adId = json["ad_id"];
        boostedStatus = json["boosted_status"];
        boostUnavailableIdentifier = json["boost_unavailable_identifier"];
        boostUnavailableReason = json["boost_unavailable_reason"];
        caption = json["caption"] == null ? null : Caption.fromJson(json["caption"]);
        captionIsEdited = json["caption_is_edited"];
        feedDemotionControl = json["feed_demotion_control"];
        feedRecsDemotionControl = json["feed_recs_demotion_control"];
        takenAt = json["taken_at"];
        inventorySource = json["inventory_source"];
        videoVersions = json["video_versions"] == null ? null : (json["video_versions"] as List).map((e) => VideoVersions.fromJson(e)).toList();
        isDashEligible = json["is_dash_eligible"];
        numberOfQualities = json["number_of_qualities"];
        videoDashManifest = json["video_dash_manifest"];
        imageVersions2 = json["image_versions2"] == null ? null : ImageVersions2.fromJson(json["image_versions2"]);
        sharingFrictionInfo = json["sharing_friction_info"] == null ? null : SharingFrictionInfo.fromJson(json["sharing_friction_info"]);
        isPaidPartnership = json["is_paid_partnership"];
        sponsorTags = json["sponsor_tags"];
        affiliateInfo = json["affiliate_info"];
        originalHeight = json["original_height"];
        originalWidth = json["original_width"];
        organicTrackingToken = json["organic_tracking_token"];
        link = json["link"];
        storyCta = json["story_cta"];
        user = json["user"] == null ? null : User.fromJson(json["user"]);
        group = json["group"];
        owner = json["owner"] == null ? null : Owner.fromJson(json["owner"]);
        coauthorProducers = json["coauthor_producers"] ?? [];
        invitedCoauthorProducers = json["invited_coauthor_producers"] ?? [];
        followHashtagInfo = json["follow_hashtag_info"];
        title = json["title"];
        commentCount = json["comment_count"];
        commentsDisabled = json["comments_disabled"];
        commentingDisabledForViewer = json["commenting_disabled_for_viewer"];
        likeAndViewCountsDisabled = json["like_and_view_counts_disabled"];
        hasLiked = json["has_liked"];
        topLikers = json["top_likers"] ?? [];
        facepileTopLikers = json["facepile_top_likers"] ?? [];
        likeCount = json["like_count"];
        preview = json["preview"];
        canSeeInsightsAsBrand = json["can_see_insights_as_brand"];
        socialContext = json["social_context"];
        viewCount = json["view_count"];
        canReshare = json["can_reshare"];
        canViewerReshare = json["can_viewer_reshare"];
        igMediaSharingDisabled = json["ig_media_sharing_disabled"];
        photoOfYou = json["photo_of_you"];
        productType = json["product_type"];
        mediaType = json["media_type"];
        usertags = json["usertags"];
        mediaOverlayInfo = json["media_overlay_info"];
        carouselParentId = json["carousel_parent_id"];
        carouselMediaCount = json["carousel_media_count"];
        carouselMedia = json["carousel_media"];
        location = json["location"];
        hasAudio = json["has_audio"];
        clipsMetadata = json["clips_metadata"] == null ? null : ClipsMetadata.fromJson(json["clips_metadata"]);
        clipsAttributionInfo = json["clips_attribution_info"];
        accessibilityCaption = json["accessibility_caption"];
        audience = json["audience"];
        displayUri = json["display_uri"];
        mediaCroppingInfo = json["media_cropping_info"];
        profileGridThumbnailFittingStyle = json["profile_grid_thumbnail_fitting_style"];
        thumbnails = json["thumbnails"];
        timelinePinnedUserIds = json["timeline_pinned_user_ids"] == null ? null : List<String>.from(json["timeline_pinned_user_ids"]);
        upcomingEvent = json["upcoming_event"];
        loggingInfoToken = json["logging_info_token"];
        explore = json["explore"];
        mainFeedCarouselStartingMediaId = json["main_feed_carousel_starting_media_id"];
        isSeen = json["is_seen"];
        openCarouselSubmissionState = json["open_carousel_submission_state"];
        previousSubmitter = json["previous_submitter"];
        allPreviousSubmitters = json["all_previous_submitters"];
        headline = json["headline"];
        comments = json["comments"];
        fbLikeCount = json["fb_like_count"];
        savedCollectionIds = json["saved_collection_ids"];
        hasViewerSaved = json["has_viewer_saved"];
        mediaLevelCommentControls = json["media_level_comment_controls"];
        typename = json["__typename"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["code"] = code;
        _data["pk"] = pk;
        _data["id"] = id;
        _data["ad_id"] = adId;
        _data["boosted_status"] = boostedStatus;
        _data["boost_unavailable_identifier"] = boostUnavailableIdentifier;
        _data["boost_unavailable_reason"] = boostUnavailableReason;
        if(caption != null) {
            _data["caption"] = caption?.toJson();
        }
        _data["caption_is_edited"] = captionIsEdited;
        _data["feed_demotion_control"] = feedDemotionControl;
        _data["feed_recs_demotion_control"] = feedRecsDemotionControl;
        _data["taken_at"] = takenAt;
        _data["inventory_source"] = inventorySource;
        if(videoVersions != null) {
            _data["video_versions"] = videoVersions?.map((e) => e.toJson()).toList();
        }
        _data["is_dash_eligible"] = isDashEligible;
        _data["number_of_qualities"] = numberOfQualities;
        _data["video_dash_manifest"] = videoDashManifest;
        if(imageVersions2 != null) {
            _data["image_versions2"] = imageVersions2?.toJson();
        }
        if(sharingFrictionInfo != null) {
            _data["sharing_friction_info"] = sharingFrictionInfo?.toJson();
        }
        _data["is_paid_partnership"] = isPaidPartnership;
        _data["sponsor_tags"] = sponsorTags;
        _data["affiliate_info"] = affiliateInfo;
        _data["original_height"] = originalHeight;
        _data["original_width"] = originalWidth;
        _data["organic_tracking_token"] = organicTrackingToken;
        _data["link"] = link;
        _data["story_cta"] = storyCta;
        if(user != null) {
            _data["user"] = user?.toJson();
        }
        _data["group"] = group;
        if(owner != null) {
            _data["owner"] = owner?.toJson();
        }
        if(coauthorProducers != null) {
            _data["coauthor_producers"] = coauthorProducers;
        }
        if(invitedCoauthorProducers != null) {
            _data["invited_coauthor_producers"] = invitedCoauthorProducers;
        }
        _data["follow_hashtag_info"] = followHashtagInfo;
        _data["title"] = title;
        _data["comment_count"] = commentCount;
        _data["comments_disabled"] = commentsDisabled;
        _data["commenting_disabled_for_viewer"] = commentingDisabledForViewer;
        _data["like_and_view_counts_disabled"] = likeAndViewCountsDisabled;
        _data["has_liked"] = hasLiked;
        if(topLikers != null) {
            _data["top_likers"] = topLikers;
        }
        if(facepileTopLikers != null) {
            _data["facepile_top_likers"] = facepileTopLikers;
        }
        _data["like_count"] = likeCount;
        _data["preview"] = preview;
        _data["can_see_insights_as_brand"] = canSeeInsightsAsBrand;
        _data["social_context"] = socialContext;
        _data["view_count"] = viewCount;
        _data["can_reshare"] = canReshare;
        _data["can_viewer_reshare"] = canViewerReshare;
        _data["ig_media_sharing_disabled"] = igMediaSharingDisabled;
        _data["photo_of_you"] = photoOfYou;
        _data["product_type"] = productType;
        _data["media_type"] = mediaType;
        _data["usertags"] = usertags;
        _data["media_overlay_info"] = mediaOverlayInfo;
        _data["carousel_parent_id"] = carouselParentId;
        _data["carousel_media_count"] = carouselMediaCount;
        _data["carousel_media"] = carouselMedia;
        _data["location"] = location;
        _data["has_audio"] = hasAudio;
        if(clipsMetadata != null) {
            _data["clips_metadata"] = clipsMetadata?.toJson();
        }
        _data["clips_attribution_info"] = clipsAttributionInfo;
        _data["accessibility_caption"] = accessibilityCaption;
        _data["audience"] = audience;
        _data["display_uri"] = displayUri;
        _data["media_cropping_info"] = mediaCroppingInfo;
        _data["profile_grid_thumbnail_fitting_style"] = profileGridThumbnailFittingStyle;
        _data["thumbnails"] = thumbnails;
        if(timelinePinnedUserIds != null) {
            _data["timeline_pinned_user_ids"] = timelinePinnedUserIds;
        }
        _data["upcoming_event"] = upcomingEvent;
        _data["logging_info_token"] = loggingInfoToken;
        _data["explore"] = explore;
        _data["main_feed_carousel_starting_media_id"] = mainFeedCarouselStartingMediaId;
        _data["is_seen"] = isSeen;
        _data["open_carousel_submission_state"] = openCarouselSubmissionState;
        _data["previous_submitter"] = previousSubmitter;
        _data["all_previous_submitters"] = allPreviousSubmitters;
        _data["headline"] = headline;
        _data["comments"] = comments;
        _data["fb_like_count"] = fbLikeCount;
        _data["saved_collection_ids"] = savedCollectionIds;
        _data["has_viewer_saved"] = hasViewerSaved;
        _data["media_level_comment_controls"] = mediaLevelCommentControls;
        _data["__typename"] = typename;
        return _data;
    }
}

class ClipsMetadata {
    String? audioType;
    AchievementsInfo? achievementsInfo;
    MusicInfo? musicInfo;
    dynamic originalSoundInfo;

    ClipsMetadata({this.audioType, this.achievementsInfo, this.musicInfo, this.originalSoundInfo});

    ClipsMetadata.fromJson(Map<String, dynamic> json) {
        audioType = json["audio_type"];
        achievementsInfo = json["achievements_info"] == null ? null : AchievementsInfo.fromJson(json["achievements_info"]);
        musicInfo = json["music_info"] == null ? null : MusicInfo.fromJson(json["music_info"]);
        originalSoundInfo = json["original_sound_info"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["audio_type"] = audioType;
        if(achievementsInfo != null) {
            _data["achievements_info"] = achievementsInfo?.toJson();
        }
        if(musicInfo != null) {
            _data["music_info"] = musicInfo?.toJson();
        }
        _data["original_sound_info"] = originalSoundInfo;
        return _data;
    }
}

class MusicInfo {
    MusicConsumptionInfo? musicConsumptionInfo;
    MusicAssetInfo? musicAssetInfo;

    MusicInfo({this.musicConsumptionInfo, this.musicAssetInfo});

    MusicInfo.fromJson(Map<String, dynamic> json) {
        musicConsumptionInfo = json["music_consumption_info"] == null ? null : MusicConsumptionInfo.fromJson(json["music_consumption_info"]);
        musicAssetInfo = json["music_asset_info"] == null ? null : MusicAssetInfo.fromJson(json["music_asset_info"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(musicConsumptionInfo != null) {
            _data["music_consumption_info"] = musicConsumptionInfo?.toJson();
        }
        if(musicAssetInfo != null) {
            _data["music_asset_info"] = musicAssetInfo?.toJson();
        }
        return _data;
    }
}

class MusicAssetInfo {
    String? audioClusterId;
    String? title;
    String? displayArtist;
    bool? isExplicit;

    MusicAssetInfo({this.audioClusterId, this.title, this.displayArtist, this.isExplicit});

    MusicAssetInfo.fromJson(Map<String, dynamic> json) {
        audioClusterId = json["audio_cluster_id"];
        title = json["title"];
        displayArtist = json["display_artist"];
        isExplicit = json["is_explicit"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["audio_cluster_id"] = audioClusterId;
        _data["title"] = title;
        _data["display_artist"] = displayArtist;
        _data["is_explicit"] = isExplicit;
        return _data;
    }
}

class MusicConsumptionInfo {
    bool? shouldMuteAudio;
    String? shouldMuteAudioReason;
    bool? isTrendingInClips;

    MusicConsumptionInfo({this.shouldMuteAudio, this.shouldMuteAudioReason, this.isTrendingInClips});

    MusicConsumptionInfo.fromJson(Map<String, dynamic> json) {
        shouldMuteAudio = json["should_mute_audio"];
        shouldMuteAudioReason = json["should_mute_audio_reason"];
        isTrendingInClips = json["is_trending_in_clips"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["should_mute_audio"] = shouldMuteAudio;
        _data["should_mute_audio_reason"] = shouldMuteAudioReason;
        _data["is_trending_in_clips"] = isTrendingInClips;
        return _data;
    }
}

class AchievementsInfo {
    bool? showAchievements;

    AchievementsInfo({this.showAchievements});

    AchievementsInfo.fromJson(Map<String, dynamic> json) {
        showAchievements = json["show_achievements"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["show_achievements"] = showAchievements;
        return _data;
    }
}

class Owner {
    String? pk;
    String? profilePicUrl;
    String? username;
    FriendshipStatus1? friendshipStatus;
    bool? isEmbedsDisabled;
    bool? isUnpublished;
    bool? isVerified;
    bool? showAccountTransparencyDetails;
    dynamic supervisionInfo;
    dynamic transparencyProduct;
    bool? transparencyProductEnabled;
    dynamic transparencyLabel;
    dynamic aiAgentOwnerUsername;
    String? id;
    String? typename;
    bool? isPrivate;

    Owner({this.pk, this.profilePicUrl, this.username, this.friendshipStatus, this.isEmbedsDisabled, this.isUnpublished, this.isVerified, this.showAccountTransparencyDetails, this.supervisionInfo, this.transparencyProduct, this.transparencyProductEnabled, this.transparencyLabel, this.aiAgentOwnerUsername, this.id, this.typename, this.isPrivate});

    Owner.fromJson(Map<String, dynamic> json) {
        pk = json["pk"];
        profilePicUrl = json["profile_pic_url"];
        username = json["username"];
        friendshipStatus = json["friendship_status"] == null ? null : FriendshipStatus1.fromJson(json["friendship_status"]);
        isEmbedsDisabled = json["is_embeds_disabled"];
        isUnpublished = json["is_unpublished"];
        isVerified = json["is_verified"];
        showAccountTransparencyDetails = json["show_account_transparency_details"];
        supervisionInfo = json["supervision_info"];
        transparencyProduct = json["transparency_product"];
        transparencyProductEnabled = json["transparency_product_enabled"];
        transparencyLabel = json["transparency_label"];
        aiAgentOwnerUsername = json["ai_agent_owner_username"];
        id = json["id"];
        typename = json["__typename"];
        isPrivate = json["is_private"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["pk"] = pk;
        _data["profile_pic_url"] = profilePicUrl;
        _data["username"] = username;
        if(friendshipStatus != null) {
            _data["friendship_status"] = friendshipStatus?.toJson();
        }
        _data["is_embeds_disabled"] = isEmbedsDisabled;
        _data["is_unpublished"] = isUnpublished;
        _data["is_verified"] = isVerified;
        _data["show_account_transparency_details"] = showAccountTransparencyDetails;
        _data["supervision_info"] = supervisionInfo;
        _data["transparency_product"] = transparencyProduct;
        _data["transparency_product_enabled"] = transparencyProductEnabled;
        _data["transparency_label"] = transparencyLabel;
        _data["ai_agent_owner_username"] = aiAgentOwnerUsername;
        _data["id"] = id;
        _data["__typename"] = typename;
        _data["is_private"] = isPrivate;
        return _data;
    }
}

class FriendshipStatus1 {
    bool? isFeedFavorite;
    bool? following;
    bool? isRestricted;
    bool? isBestie;

    FriendshipStatus1({this.isFeedFavorite, this.following, this.isRestricted, this.isBestie});

    FriendshipStatus1.fromJson(Map<String, dynamic> json) {
        isFeedFavorite = json["is_feed_favorite"];
        following = json["following"];
        isRestricted = json["is_restricted"];
        isBestie = json["is_bestie"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["is_feed_favorite"] = isFeedFavorite;
        _data["following"] = following;
        _data["is_restricted"] = isRestricted;
        _data["is_bestie"] = isBestie;
        return _data;
    }
}

class User {
    String? pk;
    String? username;
    String? profilePicUrl;
    bool? isPrivate;
    bool? isEmbedsDisabled;
    bool? isUnpublished;
    bool? isVerified;
    FriendshipStatus? friendshipStatus;
    int? latestBestiesReelMedia;
    int? latestReelMedia;
    dynamic liveBroadcastVisibility;
    dynamic liveBroadcastId;
    dynamic seen;
    dynamic supervisionInfo;
    String? id;
    HdProfilePicUrlInfo? hdProfilePicUrlInfo;
    String? fullName;
    String? typename;
    String? profilePicUrlWrapped;

    User({this.pk, this.username, this.profilePicUrl, this.isPrivate, this.isEmbedsDisabled, this.isUnpublished, this.isVerified, this.friendshipStatus, this.latestBestiesReelMedia, this.latestReelMedia, this.liveBroadcastVisibility, this.liveBroadcastId, this.seen, this.supervisionInfo, this.id, this.hdProfilePicUrlInfo, this.fullName, this.typename, this.profilePicUrlWrapped});

    User.fromJson(Map<String, dynamic> json) {
        pk = json["pk"];
        username = json["username"];
        profilePicUrl = json["profile_pic_url"];
        isPrivate = json["is_private"];
        isEmbedsDisabled = json["is_embeds_disabled"];
        isUnpublished = json["is_unpublished"];
        isVerified = json["is_verified"];
        friendshipStatus = json["friendship_status"] == null ? null : FriendshipStatus.fromJson(json["friendship_status"]);
        latestBestiesReelMedia = json["latest_besties_reel_media"];
        latestReelMedia = json["latest_reel_media"];
        liveBroadcastVisibility = json["live_broadcast_visibility"];
        liveBroadcastId = json["live_broadcast_id"];
        seen = json["seen"];
        supervisionInfo = json["supervision_info"];
        id = json["id"];
        hdProfilePicUrlInfo = json["hd_profile_pic_url_info"] == null ? null : HdProfilePicUrlInfo.fromJson(json["hd_profile_pic_url_info"]);
        fullName = json["full_name"];
        typename = json["__typename"];
        profilePicUrlWrapped = json["profile_pic_url_wrapped"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["pk"] = pk;
        _data["username"] = username;
        _data["profile_pic_url"] = profilePicUrl;
        _data["is_private"] = isPrivate;
        _data["is_embeds_disabled"] = isEmbedsDisabled;
        _data["is_unpublished"] = isUnpublished;
        _data["is_verified"] = isVerified;
        if(friendshipStatus != null) {
            _data["friendship_status"] = friendshipStatus?.toJson();
        }
        _data["latest_besties_reel_media"] = latestBestiesReelMedia;
        _data["latest_reel_media"] = latestReelMedia;
        _data["live_broadcast_visibility"] = liveBroadcastVisibility;
        _data["live_broadcast_id"] = liveBroadcastId;
        _data["seen"] = seen;
        _data["supervision_info"] = supervisionInfo;
        _data["id"] = id;
        if(hdProfilePicUrlInfo != null) {
            _data["hd_profile_pic_url_info"] = hdProfilePicUrlInfo?.toJson();
        }
        _data["full_name"] = fullName;
        _data["__typename"] = typename;
        _data["profile_pic_url_wrapped"] = profilePicUrlWrapped;
        return _data;
    }
}

class HdProfilePicUrlInfo {
    String? url;
    String? urlWrapped;

    HdProfilePicUrlInfo({this.url, this.urlWrapped});

    HdProfilePicUrlInfo.fromJson(Map<String, dynamic> json) {
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

class FriendshipStatus {
    bool? following;
    bool? isBestie;
    bool? isFeedFavorite;
    bool? isRestricted;

    FriendshipStatus({this.following, this.isBestie, this.isFeedFavorite, this.isRestricted});

    FriendshipStatus.fromJson(Map<String, dynamic> json) {
        following = json["following"];
        isBestie = json["is_bestie"];
        isFeedFavorite = json["is_feed_favorite"];
        isRestricted = json["is_restricted"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["following"] = following;
        _data["is_bestie"] = isBestie;
        _data["is_feed_favorite"] = isFeedFavorite;
        _data["is_restricted"] = isRestricted;
        return _data;
    }
}

class SharingFrictionInfo {
    dynamic bloksAppUrl;
    bool? shouldHaveSharingFriction;

    SharingFrictionInfo({this.bloksAppUrl, this.shouldHaveSharingFriction});

    SharingFrictionInfo.fromJson(Map<String, dynamic> json) {
        bloksAppUrl = json["bloks_app_url"];
        shouldHaveSharingFriction = json["should_have_sharing_friction"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["bloks_app_url"] = bloksAppUrl;
        _data["should_have_sharing_friction"] = shouldHaveSharingFriction;
        return _data;
    }
}

class ImageVersions2 {
    List<Candidates>? candidates;

    ImageVersions2({this.candidates});

    ImageVersions2.fromJson(Map<String, dynamic> json) {
        candidates = json["candidates"] == null ? null : (json["candidates"] as List).map((e) => Candidates.fromJson(e)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(candidates != null) {
            _data["candidates"] = candidates?.map((e) => e.toJson()).toList();
        }
        return _data;
    }
}

class Candidates {
    String? url;
    int? height;
    int? width;
    String? urlWrapped;

    Candidates({this.url, this.height, this.width, this.urlWrapped});

    Candidates.fromJson(Map<String, dynamic> json) {
        url = json["url"];
        height = json["height"];
        width = json["width"];
        urlWrapped = json["url_wrapped"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["url"] = url;
        _data["height"] = height;
        _data["width"] = width;
        _data["url_wrapped"] = urlWrapped;
        return _data;
    }
}

class VideoVersions {
    int? width;
    int? height;
    String? url;
    int? type;
    String? urlWrapped;

    VideoVersions({this.width, this.height, this.url, this.type, this.urlWrapped});

    VideoVersions.fromJson(Map<String, dynamic> json) {
        width = json["width"];
        height = json["height"];
        url = json["url"];
        type = json["type"];
        urlWrapped = json["url_wrapped"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["width"] = width;
        _data["height"] = height;
        _data["url"] = url;
        _data["type"] = type;
        _data["url_wrapped"] = urlWrapped;
        return _data;
    }
}

class Caption {
    bool? hasTranslation;
    int? createdAt;
    String? pk;
    String? text;

    Caption({this.hasTranslation, this.createdAt, this.pk, this.text});

    Caption.fromJson(Map<String, dynamic> json) {
        hasTranslation = json["has_translation"];
        createdAt = json["created_at"];
        pk = json["pk"];
        text = json["text"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["has_translation"] = hasTranslation;
        _data["created_at"] = createdAt;
        _data["pk"] = pk;
        _data["text"] = text;
        return _data;
    }
}