import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iknoweverything/models/answer.dart';

class QuestionAnswerPage extends StatefulWidget {
  const QuestionAnswerPage({Key? key}) : super(key: key);

  @override
  _QuestionAnswerPageState createState() => _QuestionAnswerPageState();
}

class _QuestionAnswerPageState extends State<QuestionAnswerPage> {
  /// Text editing controller for question text field
  TextEditingController _questionFieldController = TextEditingController();

  /// To store the current asnwer object
  late Answer _currentAnswer;

  /// Function - to handle the process of getting a yes or no answer
  _handleGetAnswer() async {
    try {
      http.Response response = await http.get(
        Uri.parse('https://yesno.wtf/api'),
      );
      if (response.statusCode == 200 && response.body != null) {
        print(response.body.runtimeType);
        Map<String, dynamic> responseBody = json
            .decode(response.body); //dart convert lib, does the json decoding
        Answer answer = Answer.fromMap(responseBody);
        setState(() {
          _currentAnswer = answer;
        });
      }
    } catch (err, stacktrace) {
      print(err);
      print(stacktrace);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('I Know Everything'),
        centerTitle: true,
        backgroundColor: Colors.amber[800],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 0.4 * MediaQuery.of(context).size.width,
            child: TextField(
                decoration: InputDecoration(
                    labelText: 'Ask a question', border: OutlineInputBorder())),
            padding: EdgeInsets.all(5.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ))),
                onPressed: _handleGetAnswer,
                child: Text('Get Answer'),
              ),
              SizedBox(
                width: 20,
              ),

              //TODO: resolve the error
              //

              if (_currentAnswer != null)
                Container(
                  height: 250,
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(_currentAnswer.image),
                      )),
                ),
              if (_currentAnswer != null)
                SizedBox(
                  width: 20,
                ),
              ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ))),
                onPressed: () {},
                child: Text('Reset'),
              )
            ],
          )
        ],
      ),
    );
  }
}
