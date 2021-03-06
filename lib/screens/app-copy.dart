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
  var xdata=[];
  Widget createList(List<Student> data) {
    return new ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          title: Text(data[index].name),
          subtitle: Text(data[index].id.toString()),
          onTap: () {/* react to the tile being tapped */},
        );
      },
    );
  }
  Widget createStaticList(List<Student> data) {
    return new ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20.0),
              children: <Widget>[
                ListTile(
                  title: Text(
                      " Hi ${data[0].name} your id is ${data[0].id} and score ${data[0].score} "),
                ),
                ListTile(
                  title: Text(
                      " Hi ${data[1].name} your id is ${data[1].id} and score ${data[1].score} "),
                ),
                ListTile(
                  title: Text(
                      " Hi ${data[2].name} your id is ${data[2].id} and score ${data[2].score} "),
                ),
              ]);
  }

  Widget futureWidget() {
    return new FutureBuilder<List<Student>>(
      future: loadStudent(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // createList(snapshot.data);
          xdata=snapshot.data;
          createStaticList(xdata);
          // return new ListView(
          //     shrinkWrap: true,
          //     padding: const EdgeInsets.all(20.0),
          //     children: <Widget>[
          //       ListTile(
          //         title: Text(
          //             " Hi ${snapshot.data[0].name} your id is ${snapshot.data[0].id} and score ${snapshot.data[0].score} "),
          //       ),
          //       ListTile(
          //         title: Text(
          //             " Hi ${snapshot.data[1].name} your id is ${snapshot.data[1].id} and score ${snapshot.data[1].score} "),
          //       ),
          //       ListTile(
          //         title: Text(
          //             " Hi ${snapshot.data[2].name} your id is ${snapshot.data[2].id} and score ${snapshot.data[2].score} "),
          //       ),
          //     ]);
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
