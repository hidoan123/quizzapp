
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/components/items/question_category_item.dart';
import 'package:quizz_app/data/fake_data.dart';
import 'package:quizz_app/pages/english_alphabet.dart';
import 'package:quizz_app/pages/vietnamese_alphabet.dart';

import 'caculation_page.dart';
import 'home_page.dart';


class FirstPage extends StatelessWidget {
   const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = FAKE_QUESTIONCATEGORY;
    List<Widget Function()> screenBuilders = [
          () => HomePage(),
          () => CaculationPage(),
          () => EnglishAlphabet(),
          () => VietNameseAlphabet()
    ];
    void navigateToScreen(BuildContext context, int index)
    {
      Navigator.push(context, MaterialPageRoute(builder: (context) => screenBuilders[index]()));
    }
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        title: Text(
          'Chọn 1 chủ đề',
            style: GoogleFonts.acme(
                fontSize: 27
            )
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index){
                  return QuestionCategoryItem(
                      questionCategory: list[index],
                      onTap: (){
                        print('ban da chon loai cau');
                        navigateToScreen(context, index);
                      });
                }),
          ),
        ],
      ),
    );
  }
}
