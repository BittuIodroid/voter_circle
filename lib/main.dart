import 'dart:convert';
import 'package:flutter/material.dart';
//import 'package:demo_app/post.dart';
//import 'package:demo_app/list.dart';
//import 'package:voter_circle_final/list.dart';
//import 'package:voter_circle_final/post.dart';

import 'list.dart';
import 'post.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: new FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('lib/assets/data.json'),
                builder: (context, snapshot) {
                  List<Post> posts =  parseJson(snapshot.data.toString());
                  return posts.isNotEmpty
                      ? new PostList(post: posts)
                      : new Center(child: new CircularProgressIndicator());
                }),
      ),
    );
  }

  List<Post> parseJson(String response) {
    if(response==null){
      return [];
    }
    final parsed = json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Post>((json) => new Post.fromJson(json)).toList();
  }
}
