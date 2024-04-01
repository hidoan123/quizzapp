import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app/data/fake_data.dart';

import '../data/answer_data.dart';
import '../data/questions_data.dart';
import '../provider/downtimer_provider.dart';
import '../provider/quizz_provider.dart';
import 'items/answer_item.dart';

class AnswerList extends StatefulWidget {
  final Question question;
  final List<AnswerData> answers; // Thêm danh sách câu trả lời
  AnswerList({Key? key, required this.question, required this.answers}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AnswerListState();
  }
}

class _AnswerListState extends State<AnswerList> {

  Future<void> showResultDialog(BuildContext context, bool isCorrect) async {
    final String iconPath = isCorrect ? 'assets/animations/correct.json' : 'assets/animations/wrong.json';
    // final IconData icon = isCorrect ? Icons.check : Icons.close;
    // final Color iconColor = isCorrect ? Colors.green : Colors.red;
    final String message = isCorrect ? 'Bạn đã trả lời đúng' : 'Bạn đã trả lời sai';

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 24),
                Lottie.asset(iconPath),
                SizedBox(height: 16),
                Text(
                  message,
                  style: GoogleFonts.acme(fontSize: 20)
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    final quizzProvider = Provider.of<QuizzProvider>(context, listen: false);
                    quizzProvider.updateNextAnswersandQuestion();
                    Provider.of<DownTimerProvider>(context, listen: false).resetTime();
                    if(isCorrect)
                      {
                        quizzProvider.increaseScore();
                        print(quizzProvider.score.toString());
                      }
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    final answerItems = widget.answers
        .asMap()
        .map((index, answer) {
      final isCorrect = index == widget.question.indexCorrect;

      return MapEntry(
        index,
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: isCorrect ? Colors.green.withOpacity(0.5) : Colors.red.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: AnswerItem(
            answerData: answer,
            onTapCallback: () {
              Provider.of<DownTimerProvider>(context,listen: false).exitGame();
              showResultDialog(context, isCorrect);
            },
          ),
        ),
      );
    })
        .values
        .toList();

    return GridView.builder(
      itemCount: answerItems.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return answerItems[index];
      },
    );
  }
}
