class Question {
  final int id;
  final String question;
  String response = "";

  Question({required this.id, required this.question});
  
  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      question: json['question'],
    );
  }
}

class QuestionList {
  final List<Question> questions;

  QuestionList({required this.questions});

  factory QuestionList.fromJson(Map<String, dynamic> json) {
    var list = json['questions'] as List;
    List<Question> questionsList = list.map((i) => Question.fromJson(i)).toList();
    return QuestionList(questions: questionsList);
  }
}