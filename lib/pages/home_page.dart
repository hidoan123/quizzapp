import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app/components/questions_list.dart';

import '../components/answer_list.dart';
import '../data/fake_data.dart';
import '../provider/downtimer_provider.dart';
import '../provider/quizz_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Câu hỏi về lịch sử Việt Nam',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.brown[200], // Màu nền của AppBar
      ),
      body: Center(
        child: Consumer<QuizzProvider>(
          builder: (context, quizzProvider, child) {
            final currentQuestion = quizzProvider.listQuestions[quizzProvider.currentIndex];
            final currentAnswers = quizzProvider.listAnswers[quizzProvider.currentIndex];

            if (Provider.of<DownTimerProvider>(context).isTimeUp || quizzProvider.currentIndex == quizzProvider.listQuestions.length - 1) {
              // Hiển thị dialog khi hết giờ
              return _buildTimeUpDialog(context, quizzProvider.score);
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Score: ${Provider.of<QuizzProvider>(context).score.toString()}',
                        style: GoogleFonts.acme(
                          fontSize: 20,
                        )
                      ),
                      Row(
                        children: [
                          const Icon(Icons.timer, size: 20,),
                          Text(
                            ':${Provider.of<DownTimerProvider>(context).remainingTime}',
                            style: GoogleFonts.acme(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: QuestionsList(mquestion: currentQuestion),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  height: screenHeight * 0.24,
                    width: screenWidth * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      clipBehavior: Clip.hardEdge,
                      child: Image.network(
                          currentQuestion.imageQuestion),
                    )),
                Expanded(
                    child: AnswerList(question: currentQuestion, answers: currentAnswers)),
              ],
            );
          },
        ),
      ),
    );
  }
  int count = FAKE_QUESTIONS.length;
  Widget _buildTimeUpDialog(BuildContext context, int score) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.cyan[200],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 24),
            Lottie.asset('assets/animations/time.json'),
            const SizedBox(height: 16),
            const Text(
              'Hết giờ!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Số điểm của bạn: $score/$count',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Provider.of<QuizzProvider>(context, listen: false).resetQuiz();
                Provider.of<DownTimerProvider>(context, listen: false).resetGame();
              },
              child: Text(
                'Chơi lại',
                style: GoogleFonts.acme(fontSize: 18),
              ),
            ),
            const SizedBox(height:15),
            ElevatedButton(onPressed: (){
              print('bạn đã bấm thoát');
              Navigator.of(context).pop();
              Provider.of<QuizzProvider>(context, listen: false).resetQuiz();
              //Provider.of<DownTimerProvider>(context, listen: false).resetGame();
            },
                child: Text('Thoát',style: GoogleFonts.acme(fontSize: 18),))
          ],
        ),
      ),
    );
  }
}
