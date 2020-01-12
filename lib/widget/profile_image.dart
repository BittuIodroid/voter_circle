import 'package:flutter/material.dart';


Widget postProfileImage(String profileUrl) {
  return Container(
    width: 70.0,
    height: 70.0,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: NetworkImage(profileUrl ?? "http://placehold.it/32x32"), fit: BoxFit.cover)),
  );
}



Widget commentProfileImage(String profileUrl) {
  return Container(
    width: 35.0,
    height: 35.0,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: NetworkImage(profileUrl ?? "http://placehold.it/32x32"), fit: BoxFit.cover)),
  );
}