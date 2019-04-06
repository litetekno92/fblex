import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fblex/models/student_model.dart';
import 'package:flutter/services.dart' show rootBundle;


class MyApp extends StatefulWidget {
  MyApp({Key key, this.title}) : super(key: key);
  final String title;

  @override
  MyAppState createState() => new MyAppState();

 
}



class MyAppState extends State<MyApp> {
  List<Student> data;
  
  MyAppState() {
    loadStudent().then((val) => setState(() {
          data= val;
        }));
  }


  
  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Loading..."),
        ),
      );
    } else {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Center(
          child: new ListView(
            children: data
                .map((data) => new ListTile(
                      title: new Text(data.id.toString()),
                      subtitle: new Text(data.name),
                    ))
                .toList(),
          ),
        ),
      );
    }
  }
}

