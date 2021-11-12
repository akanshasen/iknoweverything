import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QuestionAnswerPage extends StatefulWidget {
  const QuestionAnswerPage({Key? key}) : super(key: key);

  @override
  _QuestionAnswerPageState createState() => _QuestionAnswerPageState();
}

class _QuestionAnswerPageState extends State<QuestionAnswerPage> {
  /// Text editing controller for question text field
  TextEditingController _questionFieldController = TextEditingController();

  /// Function - to handle the process of getting a yes or no answer
  _handleGetAnswer() async {
    try {
      http.Response response =
          await http.get(Uri.parse('https://yesno.wtf/api'));
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
                onPressed: () {},
                child: Text('Get Answer'),
              ),
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
