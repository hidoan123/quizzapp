
import 'package:flutter/cupertino.dart';
import 'package:quizz_app/data/answer_data.dart';
import 'package:quizz_app/provider/downtimer_provider.dart';

import '../data/questions_data.dart';

class QuizzProvider with ChangeNotifier
{
   List<Question> _listQuestions;
   List<List<AnswerData>> _listAnswers;
   DownTimerProvider _downTimerProvider;
   int _currentIndex;
   int _score = 0;
   QuizzProvider({required List<Question> listQuestions, required List<List<AnswerData>> listAnswers, required DownTimerProvider downTimerProvider})
       : _listQuestions = listQuestions,
         _listAnswers = listAnswers,
         _currentIndex = 0,
          _downTimerProvider = downTimerProvider
   ;

   List<Question> get listQuestions => _listQuestions;
   List<List<AnswerData>> get listAnswers => _listAnswers;
   int get currentIndex => _currentIndex;
   int get score => _score;
   void updateNextAnswersandQuestion() {
     if (_currentIndex < _listAnswers.length - 1) {
       _currentIndex++;
       _downTimerProvider.resetTime();
       notifyListeners();
     } else {
       // Xử lý khi đã hoàn thành tất cả câu trả lời
       print('Bạn đã hoàn thành tất cả câu trả lời');
     }
   }
   void resetQuiz() {
     _currentIndex = 0; // Đặt lại chỉ số câu hỏi về 0 để bắt đầu từ câu hỏi đầu tiên.
     _score = 0; // Đặt lại điểm số về 0.
     _downTimerProvider.resetTime(); // Đặt lại thời gian đếm ngược.
     notifyListeners(); // Thông báo cho người nghe (listener) biết rằng trạng thái đã thay đổi.
   }
   void increaseScore() {
     _score++;
     notifyListeners();
   }

}