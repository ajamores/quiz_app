//Object to hold Quiz question information
class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    //copy existing list, so we dont alter the original
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
