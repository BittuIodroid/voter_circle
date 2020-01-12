

class Post {
  final String name;
  final String image;
  final String about;
  final String date;
  final List comments;
  final int likes;
  final int dislikes;
  final int commentCount;

  Post({this.name, this.image, this.about, this.date, this.comments, this.likes, this.dislikes, this.commentCount});

  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post(
      name: json['name'] as String,
      image: json['image'] as String,
      about: json['about'] as String,
      date: json['date'] as String,
      comments: json['comments'] as List,
      likes: json['likes'] as int,
      dislikes: json['dislikes'] as int,
      commentCount: json['comments'].length as int,
    );
  }
}