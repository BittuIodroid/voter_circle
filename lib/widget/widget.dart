import 'package:flutter/material.dart';


Widget profileImage(String profileUrl) {
  return Container(
    width: 70.0,
    height: 70.0,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: NetworkImage(profileUrl), fit: BoxFit.cover)),
  );
}