import 'package:flutter/material.dart';

class VietNameseAlphabet extends StatelessWidget {
  const VietNameseAlphabet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Text('this is vietnamese alphabet'),
      ),
    ));
  }
}
