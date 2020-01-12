import 'dart:convert';
import 'package:flutter/material.dart';
//import 'package:demo_app/post.dart';
//import 'package:demo_app/list.dart';
//import 'package:voter_circle_final/list.dart';
//import 'package:voter_circle_final/post.dart';

import 'list.dart';
import 'network/api_call.dart';
import 'post.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Post Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Post Data'),
    );
  }
}

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
    postObject.then((value){
    });

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
                  List<Post> posts =  snapshot.data.posts;
                 // List<Post> posts =  parseJson(snapshot.data.toString());
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Text('Press button to start.');
                    case ConnectionState.active:
                    case ConnectionState.waiting:
                      return Text('Awaiting result...');
                    case ConnectionState.done:
                      if (snapshot.hasError) return Text('Error: ${snapshot.error}');
                      return PostList(posts: posts
                          ); // Returning Post Data if no error is found
                  }
                  return null;
//                  List<Post> posts =  parseJson(snapshot.data.toString());
//                  return posts.isNotEmpty
//                      ? new PostList(post: posts)
//                      : new Center(child: new CircularProgressIndicator());
                }),
      ),
    );
  }

  /*List<Post> parseJson(String response) {
    if(response==null){
      return [];
    }
    //final parsed = json.decode(response.toString()).cast<Map<String, dynamic>>();
    final parsed = postObject.toString().cast<Map<String, dynamic>>();
    return parsed.map<Post>((json) => new Post.fromJson(json)).toList();
  }*/
}
