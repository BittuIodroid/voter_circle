import 'package:demo_app/widget/post_list_second_page.dart';
import 'package:flutter/material.dart';
import 'post_model.dart';
import 'widget/profile_image.dart';

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
      body: ListView(
        children: <Widget>[
          Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  postListCardSecondPage(post, context),
                  Positioned(
                      top: 0, left: 10, child: postProfileImage(post.image))
                ],
              ),

              //Comments Data
              Column(
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
    List<Widget> commentList = [];
    for (var comment in post.comments) {
      commentList.add(new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                commentProfileImage(comment.image),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 180, 0),
                  child: Text(comment.name.toString(),
                      style: new TextStyle(
                        fontSize: 15.0,
                        color: Colors.blue,
                      )),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
              child: Text(
                comment.date.toString(),
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.blue,
                ),
              ),
            ),
            new Text(comment.comment.toString(),
                style: new TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                )),
            new Center(
                child: new Row(
              children: <Widget>[
                Text(
                  ' Reply    ',
                  style: new TextStyle(fontSize: 15.0, color: Colors.blue),
                ),
                Icon(
                  Icons.thumb_up,
                  color: Colors.green,
                  size: 15.0,
                ),
                Text(
                  ' ' + comment.likes.toString() + '    ',
                  style: new TextStyle(fontSize: 15.0, color: Colors.black),
                ),
                Icon(
                  Icons.thumb_down,
                  color: Colors.red,
                  size: 15.0,
                ),
                Text(
                  ' ' + comment.dislikes.toString(),
                  style: new TextStyle(fontSize: 15.0, color: Colors.black),
                ),
              ],
            )),
            new Container(
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: this.getReplies(comment.replys)),
              padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
            ),
          ]));
    }
    return commentList;
  }

  List<Widget> getReplies(List<Reply> replies) {
    List<Widget> list = [];
    for (var reply in replies) {
      list.add(new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //Reply Profile Image
                commentProfileImage(reply.image),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 150, 0),
                  child: new Text(reply.name.toString(),
                      style: new TextStyle(fontSize: 15.0, color: Colors.blue)),
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: Text(reply.date,
                    style: new TextStyle(fontSize: 15.0, color: Colors.blue))),
            Text(reply.reply.toString(),
                style: new TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                )),
            new Center(
                child: new Row(children: <Widget>[
              Icon(
                Icons.thumb_up,
                color: Colors.green,
                size: 15.0,
              ),
              Text(
                ' ' + reply.likes.toString() + '    ',
                style: new TextStyle(fontSize: 15.0, color: Colors.black),
              ),
              Icon(
                Icons.thumb_down,
                color: Colors.red,
                size: 15.0,
              ),
              Text(
                ' ' + reply.dislikes.toString(),
                style: new TextStyle(fontSize: 15.0, color: Colors.black),
              ),
            ]))
          ]));
    }
    return list;
  }
}
