// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async' ;
import 'package:flutter/services.dart' show rootBundle;

List<Student> studentFromJson(String str) {
    final jsonData = json.decode(str);
    return new List<Student>.from(jsonData.map((x) => Student.fromJson(x)));
}

String studentToJson(List<Student> data) {
    final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
    return json.encode(dyn);
}

class Student {
    String id;
    String name;
    int score;
    //final AsyncMemoizer memoizer = AsyncMemoizer();

    Student({
        this.id,
        this.name,
        this.score,
    });

    factory Student.fromJson(Map<String, dynamic> json) => new Student(
        id: json["id"],
        name: json["name"],
        score: json["score"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "score": score,
    };
}



Future<String> _loadAStudentAsset() async {
  return await rootBundle.loadString('assets/student.json');
}

Future <List<Student>> loadStudent() async {
  await wait(2);
  String jsonString = await _loadAStudentAsset();
  final students = studentFromJson(jsonString);
  return students;
}

// Future <List<Student>> loadStudent() {
//   return this.memoizer.runOnce(() async {
//   await wait(2);
//   String jsonString = await _loadAStudentAsset();
//   final students = studentFromJson(jsonString);
//   return students;
// });
// }

Future wait(int seconds) {
  return new Future.delayed(Duration(seconds: seconds), () => {});
}
