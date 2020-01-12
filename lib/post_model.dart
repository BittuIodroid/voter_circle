
class PostModel {
  List<Post> posts;

  PostModel({this.posts});

  PostModel.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = new List<Post>();
      json['posts'].forEach((v) {
        posts.add(new Post.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.posts != null) {
      data['posts'] = this.posts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Post {
  String sId;
  int index;
  String image;
  int likes;
  int dislikes;
  String name;
  String about;
  String date;
  List<Comment> comments;

  Post(
      {this.sId,
        this.index,
        this.image,
        this.likes,
        this.dislikes,
        this.name,
        this.about,
        this.date,
        this.comments});

  Post.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    index = json['index'];
    image = json['image'];
    likes = json['likes'];
    dislikes = json['dislikes'];
    name = json['name'];
    about = json['about'];
    date = json['date'];
    if (json['comments'] != null) {
      comments = new List<Comment>();
      json['comments'].forEach((v) {
        comments.add(new Comment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['index'] = this.index;
    data['image'] = this.image;
    data['likes'] = this.likes;
    data['dislikes'] = this.dislikes;
    data['name'] = this.name;
    data['about'] = this.about;
    data['date'] = this.date;
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comment {
  String sId;
  int index;
  String name;
  String image;
  String comment;
  String date;
  int likes;
  int dislikes;
  List<Reply> replys;

  Comment(
      {this.sId,
        this.index,
        this.name,
        this.image,
        this.comment,
        this.date,
        this.likes,
        this.dislikes,
        this.replys});

  Comment.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    index = json['index'];
    name = json['name'];
    image = json['image'];
    comment = json['comment'];
    date = json['date'];
    likes = json['likes'];
    dislikes = json['dislikes'];
    if (json['replys'] != null) {
      replys = new List<Reply>();
      json['replys'].forEach((v) {
        replys.add(new Reply.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['index'] = this.index;
    data['name'] = this.name;
    data['image'] = this.image;
    data['comment'] = this.comment;
    data['date'] = this.date;
    data['likes'] = this.likes;
    data['dislikes'] = this.dislikes;
    if (this.replys != null) {
      data['replys'] = this.replys.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reply {
  String sId;
  int index;
  String name;
  String image;
  String reply;
  String date;
  int likes;
  int dislikes;

  Reply(
      {this.sId,
        this.index,
        this.name,
        this.image,
        this.reply,
        this.date,
        this.likes,
        this.dislikes});

  Reply.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    index = json['index'];
    name = json['name'];
    image = json['image'];
    reply = json['reply'];
    date = json['date'];
    likes = json['likes'];
    dislikes = json['dislikes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['index'] = this.index;
    data['name'] = this.name;
    data['image'] = this.image;
    data['reply'] = this.reply;
    data['date'] = this.date;
    data['likes'] = this.likes;
    data['dislikes'] = this.dislikes;
    return data;
  }
}





























//class Post {
//  final String name;
//  final String image;
//  final String about;
//  final String date;
//  final List comments;
//  final int likes;
//  final int dislikes;
//  final int commentCount;
//
//  Post({this.name, this.image, this.about, this.date, this.comments, this.likes, this.dislikes, this.commentCount});
//
//  factory Post.fromJson(Map<String, dynamic> json) {
//    return new Post(
//      name: json['name'] as String,
//      image: json['image'] as String,
//      about: json['about'] as String,
//      date: json['date'] as String,
//      comments: json['comments'] as List,
//      likes: json['likes'] as int,
//      dislikes: json['dislikes'] as int,
//      commentCount: json['comments'].length as int,
//    );
//  }
//}