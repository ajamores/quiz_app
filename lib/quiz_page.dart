import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/main_page_conent.dart';
import 'package:quiz_app/questions_page.dart';
import 'package:quiz_app/results_page.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  //default page
  var activeScreen = 'start-page';

  //Save user answers
  List<String> selectedAnswers = [];

  //self explanatory
  switchScreen() {
    setState(() {
      activeScreen = 'questions-page';
      print(activeScreen);
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
        selectedAnswers = [];
      });
    }
  }

  //States allows this widget to 'build' again once the state changes
  @override
  Widget build(BuildContext context) {
    Widget screenWidget = MainPageConent(switchScreen);

    if (activeScreen == 'questions-page') {
      print("Switching Screens");
      screenWidget = QuestionsPage(
        onSelectAnswer: chooseAnswer,
      ); //pass the function
    }

    if (activeScreen == 'results-screen') {
      screenWidget = const ResultsPage();
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: startAlignment,
              end: endAlignment,
            ),
          ),
          child:
              screenWidget, //Flutter looks at what’s in activeScreen and shows that widget.
        ),
      ),
    );
  }
}
