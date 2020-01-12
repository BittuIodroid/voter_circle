import 'package:flutter/material.dart';
//import 'package:demo_app/post.dart';
//import 'package:voter_circle_final/post.dart';
//import 'package:voter_circle_final/post.dart';

import 'post.dart';

// ignore: must_be_immutable
class PostDetail extends StatelessWidget {
  Post post;

  PostDetail({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Detail'),
      ),
      body: new ListView(
        children: <Widget>[
          new Center(
              child: new Column(
            // Stretch the cards in horizontal axis
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              new Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    new Text(
                      // Read the name field value and set it in the Text widget
                      post.name,
                      // set some style to text
                      style: new TextStyle(
                          fontSize: 25.0, color: Colors.lightBlueAccent),
                    ),
                  ]),
              new Column(crossAxisAlignment: CrossAxisAlignment.end, children: <
                  Widget>[
                new Text(
                  // Read the name field value and set it in the Text widget
                  post.date,
                  // set some style to text
                  style: new TextStyle(
                      fontSize: 14.0, color: Colors.lightBlueAccent),
                ),
                new Text(
                  // Read the name field value and set it in the Text widget
                  "Post:- " + post.about,
                  // set some style to text
                  style: new TextStyle(fontSize: 20.0, color: Colors.black),
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
                      ' ' + post.comments.length.toString() + '    ',
                      // set some style to text
                      style: new TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                    Icon(
                      Icons.thumb_up,
                      color: Colors.green,
                      size: 30.0,
                    ),
                    Text(
                      ' ' + post.likes.toString() + '    ',
                      // set some style to text
                      style: new TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                    Icon(
                      Icons.thumb_down,
                      color: Colors.red,
                      size: 30.0,
                    ),
                    Text(
                      ' ' + post.dislikes.toString(),
                      // set some style to text
                      style: new TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                  ],
                )),
                new Divider(),
              ]),
              new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      "Comments:",
                      style: new TextStyle(
                        fontSize: 24.0,
                        color: Colors.black,
                      ),
                    ),
                    new Divider(
                      thickness: 4,
                    ),
                  ]),
              new Container(
                child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: this.getComments()),
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              ),
            ],
          ))
        ],
        padding: const EdgeInsets.all(15.0),
      ),
    );
  }

  List<Widget> getComments() {
    List<Widget> list = [];
    for (var comm in post.comments) {
      list.add(new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(comm.name.toString(),
                style: new TextStyle(
                  fontSize: 15.0,
                  color: Colors.blue,
                )),
            new Text(comm.comment.toString(),
                style: new TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                )),
            new Divider(),
            new Center(
                child: new Row(
              children: <Widget>[
                Text(
                  ' Reply    ',
                  // set some style to text
                  style: new TextStyle(fontSize: 15.0, color: Colors.blue),
                ),
                Icon(
                  Icons.thumb_up,
                  color: Colors.green,
                  size: 15.0,
                ),
                Text(
                  ' ' + comm.likes.toString() + '    ',
                  // set some style to text
                  style: new TextStyle(fontSize: 15.0, color: Colors.black),
                ),
                Icon(
                  Icons.thumb_down,
                  color: Colors.red,
                  size: 15.0,
                ),
                Text(
                  ' ' + comm.dislikes.toString(),
                  // set some style to text
                  style: new TextStyle(fontSize: 15.0, color: Colors.black),
                ),
              ],
            )),
            new Divider(),
            new Container(
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: this.getReplys(comm.replys)),
              padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
            ),
            new Divider(),
          ]));
    }
    return list;
  }

  List<Widget> getReplys(List<Reply> replys) {
    List<Widget> list = [];
    for (var rep in replys) {
      list.add(new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(rep.name.toString(),
                style: new TextStyle(
                  fontSize: 15.0,
                  color: Colors.blue,
                )),
            new Text(rep.reply.toString(),
                style: new TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                )),
            new Divider(),
            new Center(
                child: new Row(children: <Widget>[
              Icon(
                Icons.thumb_up,
                color: Colors.green,
                size: 15.0,
              ),
              Text(
                ' ' + rep.likes.toString() + '    ',
                // set some style to text
                style: new TextStyle(fontSize: 15.0, color: Colors.black),
              ),
              Icon(
                Icons.thumb_down,
                color: Colors.red,
                size: 15.0,
              ),
              Text(
                ' ' + rep.dislikes.toString(),
                // set some style to text
                style: new TextStyle(fontSize: 15.0, color: Colors.black),
              ),
            ]))
          ]));
    }
    return list;
  }
}
