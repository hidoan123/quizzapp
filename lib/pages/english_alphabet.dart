import 'package:flutter/material.dart';
class EnglishAlphabet extends StatelessWidget {
  const EnglishAlphabet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(
        child: Text('this is english alphabet'),
      ),
    ));
  }
}
