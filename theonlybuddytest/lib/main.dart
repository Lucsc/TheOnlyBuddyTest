import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:theonlybuddytest/question.dart';
import "dart:convert";

import 'package:theonlybuddytest/questionspage.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  QuestionList? questions;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold (
        appBar: AppBar(title : const Text("The Only Buddy Test")),
        body : FutureBuilder<QuestionList>(
          future : _loadQuestions(),
          builder : (context, snapshot) {
            if (snapshot.hasData) {
              questions = snapshot.data;
              return Questionspage(
                currentQuestion: questions!.questions[0].question,
                listQuestions: questions!,
                index: 0,
              );
            } else {
              return const CircularProgressIndicator();
            }
          }
        )
      ),
    );
  }
}

Future<String> _loadQuestionsJson() async {
  return await rootBundle.loadString('assets/questions.json');
}

Future<QuestionList> _loadQuestions() async {
  String jsonString = await _loadQuestionsJson();
  final jsonResponse = json.decode(jsonString);
  return QuestionList.fromJson(jsonResponse);
}