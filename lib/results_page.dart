import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';


class ResultsPage extends StatelessWidget {
  const ResultsPage({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  ///when using ResultsPage Constructor, called in quiz page
  ///we will pass a list of chosen answers
  final List<String> chosenAnswers;

  final void Function() onRestart;

  //Creating key value pairs with Map and
  //Specifing that the keys are going to be Strings
  //and the values will be of type object, as it can be numbers
  //or whatever.
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      // Note: curly braces here define a Map
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        //recall correct answer is first in the list
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;

    //filter list, does not change list and creates a new iterable,
    //if true add to new iterable list, false drop
    final numCorrectQuestions =
        summaryData.where((data) {
          return data['user_answer'] == data['correct_answer'];
        }).length; //number of correct answers in list;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 30),
            QuestionsSummary(summaryData),
            SizedBox(height: 30),
            TextButton.icon(
              onPressed: onRestart,
              icon: const Icon(
                Icons.restart_alt_rounded,
                color: Colors.white,
                size: 20,
              ),
              label: const Text(
                'Restart Quiz!',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
