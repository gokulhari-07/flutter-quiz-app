class QuestionsModel {
  const QuestionsModel({required this.question, required this.answers});

  final String question;
  final List<String> answers;

  List<String> getShuffledAnswers(){
    final getShuffledAnswers=List.of(answers); //took a copy of the answers to shuffle because we need the original order of the answers 
    //list to find the corrct option behind the scenes. Also if we try to shuffle the original list, it throws ERROR during run time 
    //because we have given const to the data and hence those r immutable or unmodifiable. Here shuffle method tries to mutate it and
    // throws error.
   getShuffledAnswers.shuffle();
   return getShuffledAnswers;
  }
}