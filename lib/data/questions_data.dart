
import 'answer_data.dart';

class Question{
  final index;
  final String question;
  final indexCorrect;
  final String imageQuestion;
  final List<AnswerData> mlistAnswer;
  Question({required this.index,
            required this.question,
            required this.indexCorrect,
            required this.mlistAnswer,
            required this.imageQuestion});
}