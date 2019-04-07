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
  List<Student> data = [];
  String title = "Kdr Testing";

  Future<String> _loadAStudentAsset() async {
    return await rootBundle.loadString('assets/student.json');
  }

  void loadStudent() async {
    await wait(2);
    String jsonString = await _loadAStudentAsset();
    setState(() {
      final students = studentFromJson(jsonString);
      data = students;
    });

    // return students;
  }

  // MyAppState() {
  //   loadStudent().then((val) => setState(() {
  //         data= val;
  //       }));
  // }

  @override
  void initState()  {
    super.initState();
    this.loadStudent();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
          child: new ListView.builder(
        itemCount: (data == null) ? 0 : data.length,
        itemBuilder: (BuildContext context, index) {
          return new Card(
              child: new ListTile(
            title: new Text(data[index].id),
            subtitle: new Text(data[index].name),
          ));
        },
      )
          // ListView(
          //   children: data
          //       .map((data) => new ListTile(
          //             title: new Text(data.id.toString()),
          //             subtitle: new Text(data.name),
          //           ))
          //       .toList(),
          // ),
          ),
    );
  }
}
