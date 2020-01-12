import 'dart:io';

import 'package:demo_app/network/api_call.dart';
import 'package:flutter/material.dart';

import '../displaying_post_details.dart';
import '../post_model.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<PostModel> postObject;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      postObject = Network().getPostData();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
            future: postObject,
            builder: (BuildContext context, AsyncSnapshot<PostModel> snapshot) {

              // List<Post> posts =  parseJson(snapshot.data.toString());
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                case ConnectionState.done:
                  if (snapshot.hasError)
                    return Text('Error: ${snapshot.error}');
                  List<Post> posts = snapshot.data.posts;
                  return PostList(posts: posts); // Returning Post Data if no error is found
              }
              return CircularProgressIndicator();
            }),
      ),
    );
  }
}