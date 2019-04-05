import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:fblex/models/student_model.dart';

class MyApp extends StatefulWidget {
  MyApp();
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
   Widget createList(List<Student> data) {
    return new ListView.builder(
    padding: const EdgeInsets.all(10.0),
    itemCount: data.length,
    itemBuilder: (BuildContext ctxt, int index) {
                        return new ListTile(
                          title: Text(data[index].name),
                          subtitle: Text(data[index].id.toString()),
                          onTap: () { /* react to the tile being tapped */ },
                        );
                      },
           );
  }
  
  Widget futureWidget() {
    return new FutureBuilder<List<Student>>(
      future: loadStudent(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          createList(snapshot.data);
        } else if (snapshot.hasError) {
          return new Text("${snapshot.error}");
        }
        return new CircularProgressIndicator();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text('Load Json'),
            ),
            body: futureWidget()));
  }

 
}
