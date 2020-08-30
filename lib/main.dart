import 'package:flutter/material.dart';
import 'package:section_1/result.dart';
import './quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const questions = [
    {
      'questionText': 'what\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'questionText': 'what\'s your favorite animal?',
      'answers': [
       {'text' : 'Rabbit' , 'score' : 3},
       {'text' : 'Snake' , 'score' : 11 },
       {'text':'Elephant' , 'score' : 5},
        {'text' :'Lion' , 'score' : 9}
      ]
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
       {'text' : 'Max' , 'score' : 1},
        {'text' : 'Max' , 'score' : 1},
        {'text' : 'Max' , 'score' : 1},
        {'text' : 'Max' , 'score' : 1},
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0 ;

  void _restQuiz(){
   setState(() {
     _questionIndex = 0 ;
     _totalScore = 0 ;
   });
  }

  void _answerQuestion(int score) {

    _totalScore+=score;
    if (_questionIndex < questions.length) {}
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello!"),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: questions,
              )
            : Result(_totalScore , _restQuiz),
      ),
    );
  }
}
