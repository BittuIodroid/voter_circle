import 'package:flutter/material.dart';
import '../post_model.dart';
import '../post_detail.dart';

Widget postListCard(Post posts, BuildContext context) {
  return GestureDetector(
      child: Container(
        child: Center(
            child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Column(mainAxisAlignment: MainAxisAlignment.center,
//                    crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(30, 0, 80, 0),
                        child: Text(
                          posts.name,
                          style: new TextStyle(
                              fontSize: 25.0, color: Colors.lightBlueAccent),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 80, 0),
                        child: Text(
                          posts.date,
                          style: new TextStyle(
                              fontSize: 15.0, color: Colors.lightBlueAccent),
                        ),
                      ),
                    ],
                  ),
                ]),
            Container(
              margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: <
                      Widget>[
                Text(
                  // Read the name field value and set it in the Text widget
                  "Post:- " + posts.about,
                  // set some style to text
                  style: new TextStyle(fontSize: 20.0, color: Colors.black),
                ),
                Center(
                    child: new Row(
                  children: <Widget>[
                    Icon(
                      Icons.add_comment,
                      color: Colors.blue,
                      size: 30.0,
                    ),
                    Text(
                      ' ' + posts.comments.length.toString() + '    ',
                      // set some style to text
                      style: new TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                    Icon(
                      Icons.thumb_up,
                      color: Colors.green,
                      size: 30.0,
                    ),
                    Text(
                      ' ' + posts.likes.toString() + '    ',
                      // set some style to text
                      style: new TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                    Icon(
                      Icons.thumb_down,
                      color: Colors.red,
                      size: 30.0,
                    ),
                    Text(
                      ' ' + posts.dislikes.toString(),
                      // set some style to text
                      style: new TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                  ],
                )),
                new Divider(
                  height: 5,
                  thickness: 4,
                )
              ]),
            )
          ],
        )),
        padding: const EdgeInsets.all(5.0),
      ),
      onTap: () => {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => PostDetail(post: posts)),
            )
          });
}
