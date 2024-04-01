import 'package:flutter/material.dart';
import 'package:quizz_app/data/question_category.dart';

class QuestionCategoryItem extends StatelessWidget {
  final QuestionCategory questionCategory;
  final Function() onTap;

   QuestionCategoryItem({
    Key? key,
    required this.questionCategory,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors. cyanAccent,
        child: Stack(
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                clipBehavior: Clip.hardEdge,
                child: Center(
                  child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/loading.gif',
                      image: questionCategory.urlQuestionCategory),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
