import 'dart:convert';

import 'package:http/http.dart';
//import 'package:weather/model/Post_model.dart';

import '../post.dart';
//import 'package:weather/model/weather_forecast_model.dart';

class Network{
  Future<PostModel> getPostData() async{
    var finalUrl ="https://api.myjson.com/bins/quni2";
    final response = await get(Uri.encodeFull(finalUrl));
    print("URL : ${Uri.encodeFull(finalUrl)}");
    print("Inside Networl : ${response.body}");

    if(response.statusCode == 200){
      //print("Response : ${response.body}");
      return PostModel.fromJson(json.decode(response.body));
    }
    else{
      throw Exception("Error Getting data from model class");
    }
  }
}