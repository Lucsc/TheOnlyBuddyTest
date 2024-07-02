import 'package:flutter/material.dart';
import 'package:theonlybuddytest/question.dart';
import 'package:theonlybuddytest/questionspage.dart';

class EndQuestions extends StatelessWidget {
  final QuestionList listQuestions;

  const EndQuestions({super.key, required this.listQuestions});

  @override
  Widget build(BuildContext context) {
    List<Widget> questionsAndResponses = [];
    for (var i = 0; i < listQuestions.questions.length; i++) {
      questionsAndResponses.add(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding : const EdgeInsets.all(8.0),
              child : Text("A la question : ${listQuestions.questions[i].question}, vous avez répondu :",
              textAlign: TextAlign.center, style: const TextStyle(fontSize : 18)),
            ),
            Padding (padding: const EdgeInsets.all(8.0),
            child: Text(listQuestions.questions[i].response,
            textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("The Only Buddy Test Résultats"),
      ),
      body: Center(
        child : SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Column(
                children: questionsAndResponses,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Questionspage(currentQuestion: 
                      listQuestions.questions[0].question, listQuestions: listQuestions, index: 0)
                    )
                  );
                },
                child: const Text('Retour'),
              ),
            ],
          ),
        ),
      ),
    );
  }  
}