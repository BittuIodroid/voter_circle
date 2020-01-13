import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'post_model.dart';
import 'widget/list_of_posts.dart';
import 'widget/profile_image.dart';

class PostList extends StatelessWidget {
  final List<Post> posts;

  PostList({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: posts == null ? 0 : posts.length,
        itemBuilder: (BuildContext context, int postIndex) {
          return Stack(
            children: <Widget>[
              postListCard(posts[postIndex], context),
              Positioned(
                  left: 10, child: postProfileImage(posts[postIndex].image))
            ],
          );
        });
  }
}
