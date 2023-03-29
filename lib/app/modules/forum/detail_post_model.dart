class DetailPost {
  String? id;
  String? userImage;
  String? username;
  String? createdAt;
  String? content;
  int? like;
  int? comment;
  int? view;
  bool? isPolling;
  String? desc;
  List<String>? tags;
  List<String>? pooling;
  List<Comments>? comments;

  DetailPost(
      {this.id,
      this.userImage,
      this.username,
      this.createdAt,
      this.content,
      this.like,
      this.comment,
      this.view,
      this.isPolling,
      this.desc,
      this.tags,
      this.pooling,
      this.comments});

  DetailPost.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userImage = json['user_image'];
    username = json['username'];
    createdAt = json['created_at'];
    content = json['content'];
    like = json['like'];
    comment = json['comment'];
    view = json['view'];
    isPolling = json['isPolling'];
    desc = json['desc'];
    tags = json['tags'].cast<String>();
    pooling = json['pooling'].cast<String>();
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments?.add(Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_image'] = userImage;
    data['username'] = username;
    data['created_at'] = createdAt;
    data['content'] = content;
    data['like'] = like;
    data['comment'] = comment;
    data['view'] = view;
    data['isPolling'] = isPolling;
    data['desc'] = desc;
    data['tags'] = tags;
    data['pooling'] = pooling;
    if (comments != null) {
      data['comments'] = comments?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comments {
  String? id;
  String? userImage;
  String? username;
  String? createdAt;
  String? content;
  int? like;

  Comments(
      {this.id,
      this.userImage,
      this.username,
      this.createdAt,
      this.content,
      this.like});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userImage = json['user_image'];
    username = json['username'];
    createdAt = json['created_at'];
    content = json['content'];
    like = json['like'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_image'] = userImage;
    data['username'] = username;
    data['created_at'] = createdAt;
    data['content'] = content;
    data['like'] = like;
    return data;
  }
}
