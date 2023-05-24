import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dummy_apkcall/dummy_apk/modul_api.dart';

import 'package:http/http.dart' as http;

import 'dummy_apk/modul_api.dart';
import 'dummy_apk/ui_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: dummyApi(),
    );
  }
}

List<Myapi> Myapilist = [];
Future<List<Myapi>> getApi() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    for (Map<String, dynamic> i in data) {
      Myapilist.add(Myapi.fromJson((i)));
    }
    return Myapilist;
  } else {
    return Myapilist;
  }
}

List<secondApi> photolist = [];
Future<List<secondApi>> getsecondApi() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    for (Map<String, dynamic> i in data) {
      photolist.add(secondApi.fromJson(i));
    }
    print("aayoooo");
    return photolist;
  } else {
    return photolist;
  }
}
