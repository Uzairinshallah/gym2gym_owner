import 'package:flutter/material.dart';

import '../assets/CColors.dart';

class TimingScreen extends StatelessWidget {
  const TimingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GYMTOGYM'),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: CColors.bgColor,
      body: Text('Timing', style: TextStyle(color: Colors.white),),
    );
  }
}
