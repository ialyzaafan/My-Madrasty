class Question {
  String question;
  List<String> answers;
  Question(this.question, this.answers);
}

class SurveyClass {
  bool done;
  List<Question> questions;
  SurveyClass(this.done, this.questions);
}

final Question ques1 = new Question(
    'What is Your Super Power?', ['Fire Breath', 'Invincble', 'Fly']);
final Question ques2 = new Question('Who is Your Enemy?', ['Venom', 'Hulk']);
final SurveyClass survey1 = new SurveyClass(false, [ques1, ques2]);
