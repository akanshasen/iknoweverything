import 'package:flutter/material.dart';
import 'package:iknoweverything/screens/question_answer.dart';

void main() {
  runApp(IKnoweverythingWebApp());
}

class IKnoweverythingWebApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'I Know Everything',
      home: QuestionAnswerPage(),
    );
  }
}
