class PlayListModel {
    String? kind;
    String? etag;
    List<Items>? items;
    PageInfo? pageInfo;

    PlayListModel({this.kind, this.etag, this.items, this.pageInfo});

    PlayListModel.fromJson(Map<String, dynamic> json) {
        if(json["kind"] is String) {
            kind = json["kind"];
        }
        if(json["etag"] is String) {
            etag = json["etag"];
        }
        if(json["items"] is List) {
            items = json["items"] == null ? null : (json["items"] as List).map((e) => Items.fromJson(e)).toList();
        }
        if(json["pageInfo"] is Map) {
            pageInfo = json["pageInfo"] == null ? null : PageInfo.fromJson(json["pageInfo"]);
        }
    }

    static List<PlayListModel> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => PlayListModel.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["kind"] = kind;
        _data["etag"] = etag;
        if(items != null) {
            _data["items"] = items?.map((e) => e.toJson()).toList();
        }
        if(pageInfo != null) {
            _data["pageInfo"] = pageInfo?.toJson();
        }
        return _data;
    }
}

class PageInfo {
    int? totalResults;
    int? resultsPerPage;

    PageInfo({this.totalResults, this.resultsPerPage});

    PageInfo.fromJson(Map<String, dynamic> json) {
        if(json["totalResults"] is int) {
            totalResults = json["totalResults"];
        }
        if(json["resultsPerPage"] is int) {
            resultsPerPage = json["resultsPerPage"];
        }
    }

    static List<PageInfo> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => PageInfo.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["totalResults"] = totalResults;
        _data["resultsPerPage"] = resultsPerPage;
        return _data;
    }
}

class Items {
    String? kind;
    String? etag;
    String? id;
    Snippet? snippet;
    ContentDetails? contentDetails;

    Items({this.kind, this.etag, this.id, this.snippet, this.contentDetails});

    Items.fromJson(Map<String, dynamic> json) {
        if(json["kind"] is String) {
            kind = json["kind"];
        }
        if(json["etag"] is String) {
            etag = json["etag"];
        }
        if(json["id"] is String) {
            id = json["id"];
        }
        if(json["snippet"] is Map) {
            snippet = json["snippet"] == null ? null : Snippet.fromJson(json["snippet"]);
        }
        if(json["contentDetails"] is Map) {
            contentDetails = json["contentDetails"] == null ? null : ContentDetails.fromJson(json["contentDetails"]);
        }
    }

    static List<Items> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Items.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["kind"] = kind;
        _data["etag"] = etag;
        _data["id"] = id;
        if(snippet != null) {
            _data["snippet"] = snippet?.toJson();
        }
        if(contentDetails != null) {
            _data["contentDetails"] = contentDetails?.toJson();
        }
        return _data;
    }
}

class ContentDetails {
    String? videoId;
    String? videoPublishedAt;

    ContentDetails({this.videoId, this.videoPublishedAt});

    ContentDetails.fromJson(Map<String, dynamic> json) {
        if(json["videoId"] is String) {
            videoId = json["videoId"];
        }
        if(json["videoPublishedAt"] is String) {
            videoPublishedAt = json["videoPublishedAt"];
        }
    }

    static List<ContentDetails> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => ContentDetails.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["videoId"] = videoId;
        _data["videoPublishedAt"] = videoPublishedAt;
        return _data;
    }
}

class Snippet {
    String? publishedAt;
    String? channelId;
    String? title;
    String? description;
    Thumbnails? thumbnails;
    String? channelTitle;
    String? playlistId;
    int? position;
    ResourceId? resourceId;
    String? videoOwnerChannelTitle;
    String? videoOwnerChannelId;

    Snippet({this.publishedAt, this.channelId, this.title, this.description, this.thumbnails, this.channelTitle, this.playlistId, this.position, this.resourceId, this.videoOwnerChannelTitle, this.videoOwnerChannelId});

    Snippet.fromJson(Map<String, dynamic> json) {
        if(json["publishedAt"] is String) {
            publishedAt = json["publishedAt"];
        }
        if(json["channelId"] is String) {
            channelId = json["channelId"];
        }
        if(json["title"] is String) {
            title = json["title"];
        }
        if(json["description"] is String) {
            description = json["description"];
        }
        if(json["thumbnails"] is Map) {
            thumbnails = json["thumbnails"] == null ? null : Thumbnails.fromJson(json["thumbnails"]);
        }
        if(json["channelTitle"] is String) {
            channelTitle = json["channelTitle"];
        }
        if(json["playlistId"] is String) {
            playlistId = json["playlistId"];
        }
        if(json["position"] is int) {
            position = json["position"];
        }
        if(json["resourceId"] is Map) {
            resourceId = json["resourceId"] == null ? null : ResourceId.fromJson(json["resourceId"]);
        }
        if(json["videoOwnerChannelTitle"] is String) {
            videoOwnerChannelTitle = json["videoOwnerChannelTitle"];
        }
        if(json["videoOwnerChannelId"] is String) {
            videoOwnerChannelId = json["videoOwnerChannelId"];
        }
    }

    static List<Snippet> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Snippet.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["publishedAt"] = publishedAt;
        _data["channelId"] = channelId;
        _data["title"] = title;
        _data["description"] = description;
        if(thumbnails != null) {
            _data["thumbnails"] = thumbnails?.toJson();
        }
        _data["channelTitle"] = channelTitle;
        _data["playlistId"] = playlistId;
        _data["position"] = position;
        if(resourceId != null) {
            _data["resourceId"] = resourceId?.toJson();
        }
        _data["videoOwnerChannelTitle"] = videoOwnerChannelTitle;
        _data["videoOwnerChannelId"] = videoOwnerChannelId;
        return _data;
    }
}

class ResourceId {
    String? kind;
    String? videoId;

    ResourceId({this.kind, this.videoId});

    ResourceId.fromJson(Map<String, dynamic> json) {
        if(json["kind"] is String) {
            kind = json["kind"];
        }
        if(json["videoId"] is String) {
            videoId = json["videoId"];
        }
    }

    static List<ResourceId> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => ResourceId.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["kind"] = kind;
        _data["videoId"] = videoId;
        return _data;
    }
}

class Thumbnails {
    Default? defaultt;
    Medium? medium;
    High? high;
    Standard? standard;
    Maxres? maxres;

    Thumbnails({this.defaultt, this.medium, this.high, this.standard, this.maxres});

    Thumbnails.fromJson(Map<String, dynamic> json) {
        if(json["default"] is Map) {
            defaultt = json["default"] == null ? null : Default.fromJson(json["default"]);
        }
        if(json["medium"] is Map) {
            medium = json["medium"] == null ? null : Medium.fromJson(json["medium"]);
        }
        if(json["high"] is Map) {
            high = json["high"] == null ? null : High.fromJson(json["high"]);
        }
        if(json["standard"] is Map) {
            standard = json["standard"] == null ? null : Standard.fromJson(json["standard"]);
        }
        if(json["maxres"] is Map) {
            maxres = json["maxres"] == null ? null : Maxres.fromJson(json["maxres"]);
        }
    }

    static List<Thumbnails> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Thumbnails.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(defaultt != null) {
            _data["default"] = defaultt?.toJson();
        }
        if(medium != null) {
            _data["medium"] = medium?.toJson();
        }
        if(high != null) {
            _data["high"] = high?.toJson();
        }
        if(standard != null) {
            _data["standard"] = standard?.toJson();
        }
        if(maxres != null) {
            _data["maxres"] = maxres?.toJson();
        }
        return _data;
    }
}

class Maxres {
    String? url;
    int? width;
    int? height;

    Maxres({this.url, this.width, this.height});

    Maxres.fromJson(Map<String, dynamic> json) {
        if(json["url"] is String) {
            url = json["url"];
        }
        if(json["width"] is int) {
            width = json["width"];
        }
        if(json["height"] is int) {
            height = json["height"];
        }
    }

    static List<Maxres> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Maxres.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["url"] = url;
        _data["width"] = width;
        _data["height"] = height;
        return _data;
    }
}

class Standard {
    String? url;
    int? width;
    int? height;

    Standard({this.url, this.width, this.height});

    Standard.fromJson(Map<String, dynamic> json) {
        if(json["url"] is String) {
            url = json["url"];
        }
        if(json["width"] is int) {
            width = json["width"];
        }
        if(json["height"] is int) {
            height = json["height"];
        }
    }

    static List<Standard> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Standard.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["url"] = url;
        _data["width"] = width;
        _data["height"] = height;
        return _data;
    }
}

class High {
    String? url;
    int? width;
    int? height;

    High({this.url, this.width, this.height});

    High.fromJson(Map<String, dynamic> json) {
        if(json["url"] is String) {
            url = json["url"];
        }
        if(json["width"] is int) {
            width = json["width"];
        }
        if(json["height"] is int) {
            height = json["height"];
        }
    }

    static List<High> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => High.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["url"] = url;
        _data["width"] = width;
        _data["height"] = height;
        return _data;
    }
}

class Medium {
    String? url;
    int? width;
    int? height;

    Medium({this.url, this.width, this.height});

    Medium.fromJson(Map<String, dynamic> json) {
        if(json["url"] is String) {
            url = json["url"];
        }
        if(json["width"] is int) {
            width = json["width"];
        }
        if(json["height"] is int) {
            height = json["height"];
        }
    }

    static List<Medium> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Medium.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["url"] = url;
        _data["width"] = width;
        _data["height"] = height;
        return _data;
    }
}

class Default {
    String? url;
    int? width;
    int? height;

    Default({this.url, this.width, this.height});

    Default.fromJson(Map<String, dynamic> json) {
        if(json["url"] is String) {
            url = json["url"];
        }
        if(json["width"] is int) {
            width = json["width"];
        }
        if(json["height"] is int) {
            height = json["height"];
        }
    }

    static List<Default> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Default.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["url"] = url;
        _data["width"] = width;
        _data["height"] = height;
        return _data;
    }
}