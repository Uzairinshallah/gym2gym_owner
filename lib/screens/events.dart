import 'package:flutter/material.dart';

import '../assets/CColors.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GYMTOGYM'),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: CColors.bgColor,

      body: Text('Events', style: TextStyle(color: Colors.white),),
    );
  }
}
