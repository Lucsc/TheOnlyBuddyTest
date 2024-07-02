import 'package:theonlybuddytest/question.dart';
import 'package:flutter/material.dart';
import 'package:theonlybuddytest/endquestions.dart';

// ignore: must_be_immutable
class Questionspage extends StatelessWidget {
  final String currentQuestion;
  String response = "";
  final QuestionList listQuestions;
  final int index;

  Questionspage({super.key, required this.currentQuestion, this.response = "", required this.listQuestions, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("The Only Buddy Test"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding (
              padding: const EdgeInsets.all(8.0),
              child: Text(currentQuestion,
              textAlign: TextAlign.center,
              ),
            ),
            Padding (
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (text) {
                  response = text;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Réponse',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (response == "") {
                  AlertDialog alert = AlertDialog(
                    title: const Text("Erreur"),
                    content: const Text("Vous devez répondre à la question"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("OK"),
                      ),
                    ],
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                  return;
                }
                listQuestions.questions[index].response = response;
                index + 1 < listQuestions.questions.length ?
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Questionspage(
                      currentQuestion: listQuestions.questions[(index + 1) % listQuestions.questions.length].question,
                      listQuestions: listQuestions,
                      index: (index + 1),
                    ),
                  ),
                ) : Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EndQuestions(
                      listQuestions: listQuestions,
                    ),
                  )
                );
              },
              child: const Text('Suivant'),
            ),
          ],
        ),
      ),
    );
  }
}