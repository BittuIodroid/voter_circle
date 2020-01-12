import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:voter_circle_final/post.dart';
//import 'package:voter_circle_final/post_detail.dart';

import 'post.dart';
import 'post_detail.dart';
//import 'package:demo_app/post.dart';
//import 'package:demo_app/post_detail.dart';

class PostList extends StatelessWidget {
  final List<Post> post;
  PostList({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: post == null ? 0 : post.length,
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
              child: new Container(
                child: new Center(
                    child: new Column(
                  // Stretch the cards in horizontal axis
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    new Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          new Text(
                            // Read the name field value and set it in the Text widget
                            post[index].name,
                            // set some style to text
                            style: new TextStyle(
                                fontSize: 25.0, color: Colors.lightBlueAccent),
                          ),
                        ]),
                    new Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          new Text(
                            // Read the name field value and set it in the Text widget
                            post[index].date,
                            // set some style to text
                            style: new TextStyle(
                                fontSize: 14.0, color: Colors.lightBlueAccent),
                          ),
                          new Text(
                            // Read the name field value and set it in the Text widget
                            "Post:- " + post[index].about,
                            // set some style to text
                            style: new TextStyle(
                                fontSize: 20.0, color: Colors.black),
                          ),
                          new Divider(),
                          new Center(
                              child: new Row(
                            children: <Widget>[
                              Icon(
                                Icons.add_comment,
                                color: Colors.blue,
                                size: 30.0,
                              ),
                              Text(
                                ' ' + post[index].commentCount.toString() + '    ',
                                // set some style to text
                                style: new TextStyle(
                                    fontSize: 20.0, color: Colors.black),
                              ),
                              Icon(
                                Icons.thumb_up,
                                color: Colors.green,
                                size: 30.0,
                              ),
                              Text(
                                ' ' + post[index].likes.toString() + '    ',
                                // set some style to text
                                style: new TextStyle(
                                    fontSize: 20.0, color: Colors.black),
                              ),
                              Icon(
                                Icons.thumb_down,
                                color: Colors.red,
                                size: 30.0,
                              ),
                              Text(
                                ' ' + post[index].dislikes.toString(),
                                // set some style to text
                                style: new TextStyle(
                                    fontSize: 20.0, color: Colors.black),
                              ),
                            ],
                          )),
                          new Divider(
                            height: 5,
                            thickness: 4,
                          )
                        ])
                  ],
                )),
                padding: const EdgeInsets.all(15.0),
              ),
              onTap: () => {
                    // Scaffold.of(context).showSnackBar(
                    //     SnackBar(content: Text(post[index].about)))

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PostDetail(post:post[index])),
                    )
                  });
        });
  }
}
