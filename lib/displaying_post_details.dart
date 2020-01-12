import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'post.dart';
import 'post_detail.dart';
import 'widget/list_of_posts.dart';
import 'widget/widget.dart';


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
                top:0,
                left:10,
                  child: profileImage(posts[postIndex].image))
            ],
          );

        });
  }
}

//Widget postListCard(Post posts, BuildContext context) {
//  return new GestureDetector(
//      child: new Container(
//        child: new Center(
//            child: new Column(
//              // Stretch the cards in horizontal axis
//              crossAxisAlignment: CrossAxisAlignment.end,
//              children: <Widget>[
//                Column(
//                  children: <Widget>[
//
//                  ],
//                ),
//                new Column(
//                    crossAxisAlignment: CrossAxisAlignment.end,
//                    children: <Widget>[
//                      new Text(
//                        // Read the name field value and set it in the Text widget
//                        posts.name,
//                        // set some style to text
//                        style: new TextStyle(
//                            fontSize: 25.0, color: Colors.lightBlueAccent),
//                      ),
//                    ]),
//                new Column(
//                    crossAxisAlignment: CrossAxisAlignment.end,
//                    children: <Widget>[
//                      new Text(
//                        // Read the name field value and set it in the Text widget
//                        posts.date,
//                        // set some style to text
//                        style: new TextStyle(
//                            fontSize: 14.0, color: Colors.lightBlueAccent),
//                      ),
//                      new Text(
//                        // Read the name field value and set it in the Text widget
//                        "Post:- " + posts.about,
//                        // set some style to text
//                        style: new TextStyle(
//                            fontSize: 20.0, color: Colors.black),
//                      ),
//                      new Divider(),
//                      new Center(
//                          child: new Row(
//                            children: <Widget>[
//                              Icon(
//                                Icons.add_comment,
//                                color: Colors.blue,
//                                size: 30.0,
//                              ),
//                              Text(
//                                ' ' + posts.comments.length.toString() + '    ',
//                                // set some style to text
//                                style: new TextStyle(
//                                    fontSize: 20.0, color: Colors.black),
//                              ),
//                              Icon(
//                                Icons.thumb_up,
//                                color: Colors.green,
//                                size: 30.0,
//                              ),
//                              Text(
//                                ' ' + posts.likes.toString() + '    ',
//                                // set some style to text
//                                style: new TextStyle(
//                                    fontSize: 20.0, color: Colors.black),
//                              ),
//                              Icon(
//                                Icons.thumb_down,
//                                color: Colors.red,
//                                size: 30.0,
//                              ),
//                              Text(
//                                ' ' + posts.dislikes.toString(),
//                                // set some style to text
//                                style: new TextStyle(
//                                    fontSize: 20.0, color: Colors.black),
//                              ),
//                            ],
//                          )),
//                      new Divider(
//                        height: 5,
//                        thickness: 4,
//                      )
//                    ])
//              ],
//            )),
//        padding: const EdgeInsets.all(15.0),
//      ),
//      onTap: () => {
//        // Scaffold.of(context).showSnackBar(
//        //     SnackBar(content: Text(post[index].about)))
//        print(posts.comments[0].name),
//        Navigator.push(
//          context,
//          MaterialPageRoute(builder: (context) => PostDetail(post:posts)),
//        )
//      });
//}
