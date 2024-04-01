import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:quizz_app/pages/first_page.dart';
import 'package:quizz_app/pages/home_page.dart';
class Splash_Page extends StatefulWidget {
  const Splash_Page({Key? key}) : super(key: key);

  @override
  State<Splash_Page> createState() => _Splash_PageState();
}

class _Splash_PageState extends State<Splash_Page> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const FirstPage(),)
      );
    });
  }
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              //text
            Text("Welcome to quizz app!", style: GoogleFonts.acme(fontSize: 38, color: Colors.cyan)),
            //lottie
            Lottie.asset('assets/animations/animation_lnt62cek.json'),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text('Please practice and improve your knowledge every day by practice through examples',
              style: GoogleFonts.acme(fontSize: 13, color: Colors.cyan, ),),
            )
          ],
        ),
      ),
    );
  }
}
