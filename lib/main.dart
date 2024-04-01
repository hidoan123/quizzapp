import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app/pages/splash_page.dart';
import 'package:quizz_app/provider/downtimer_provider.dart';
import 'package:quizz_app/provider/quizz_provider.dart';

import 'data/fake_data.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => QuizzProvider(
              listQuestions: FAKE_QUESTIONS,
              listAnswers: FAKE_ANSWERS, downTimerProvider: DownTimerProvider(),
            ),
          ),
          ChangeNotifierProvider(
              create: (context) => DownTimerProvider()
          )
  ],
    child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The quizz app',
      debugShowCheckedModeBanner: false,
      home: Splash_Page(),
    );
  }
}

