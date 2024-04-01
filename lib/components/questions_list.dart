import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/data/questions_data.dart';

class QuestionsList extends StatefulWidget {
  final Question mquestion;
  QuestionsList({Key? key, required this.mquestion}) : super(key: key);

  @override
  State<QuestionsList> createState() => _QuestionsListState();
}

class _QuestionsListState extends State<QuestionsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300], // Màu nền
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ), // Hiệu ứng đổ bóng
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Question ${widget.mquestion.index + 1}',
            style: GoogleFonts.acme(fontSize: 18, color: Colors.deepPurpleAccent)
          ),
          const SizedBox(height: 10), // Khoảng cách giữa số câu hỏi và nội dung câu hỏi
          SizedBox(
            child: Text(
                widget.mquestion.question,
                style: GoogleFonts.acme(fontSize: 16, color: Colors.deepPurpleAccent)
            ),
          )
        ],
      ),
    );
  }
}
