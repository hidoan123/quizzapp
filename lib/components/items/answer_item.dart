import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/data/answer_data.dart';

class AnswerItem extends StatelessWidget {
  final AnswerData answerData;
  final Function() onTapCallback;

  AnswerItem({Key? key, required this.answerData, required this.onTapCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapCallback,
      splashColor: Colors.cyanAccent,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurpleAccent.withOpacity(0.7),
              Colors.deepPurpleAccent,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          color: Colors.brown[200],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            answerData.answer,
            style: GoogleFonts.acme(fontSize: 18, color: Colors.black)
          ),
        ),
      ),
    );
  }
}
