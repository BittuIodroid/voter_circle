import 'dart:convert';
import 'package:http/http.dart';
import '../post_model.dart';


class Network{
  Future<PostModel> getPostData() async{
    var finalUrl ="https://api.myjson.com/bins/quni2";
    final response = await get(Uri.encodeFull(finalUrl));

    if(response.statusCode == 200){
      return PostModel.fromJson(json.decode(response.body));
    }
    else{
      throw Exception("Error Getting data from model class");
    }
  }
}