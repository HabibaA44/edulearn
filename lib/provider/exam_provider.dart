//import 'package:edularn/data/model_data.dart';
import 'package:edularn/data/data.dart';
import 'package:edularn/data/model_data.dart';
import 'package:flutter/material.dart';

class ExamProvider extends ChangeNotifier {
  Exam? currentExam;
  List<Map<String, String>> userSelectedAnswer = [];
  String userSelectedAnswers = "";
  bool isAnswerSelected = false;
  int solvedQustion=0;

  void getSelectedExam({required String examId}) {
    final allExamData = AppData.fromJson(jsonData);
    final userSelectExam = allExamData.exams?.firstWhere(
      (Exam) => Exam.id == examId,
    );
    currentExam = userSelectExam;
  }

  void SelectAnswerFormQuestion(String? id, String questionId) {
    userSelectedAnswers = id ?? "";
    final currentQuestion = currentExam?.questions?.firstWhere(
      (Question) => Question.id == questionId,
    );

    final existingAnswerIndex = userSelectedAnswer.indexWhere(
      (answer) => answer["questionId"] == questionId,
    );
    if (existingAnswerIndex != -1) {
      userSelectedAnswer[existingAnswerIndex] = {
        "questionId": questionId,
        "answerId": id ?? "",
      };
    } else {
      userSelectedAnswer.add({"questionId": questionId, "answerId": id ?? ""});
     
    }
    isAnswerSelected =
        currentQuestion?.options?.any((element) => element.id == id) ?? false;
    notifyListeners();


  }

  void updateCurrentQuestion()
  {
 solvedQustion++;
 notifyListeners();
  }
}
