class QuizQuestion {
  QuizQuestion(this.question, this.choices);

  final String question;
  final List<String> choices;

  List<String> get shuffledChoices {
    final shuffledList = List.of(choices);
    shuffledList.shuffle();
    return shuffledList;
  }
}
