import 'package:flutter/material.dart';
import 'package:gym2gym_owner/main.dart';
import 'package:intl/intl.dart';



class UpdateAttendance extends StatefulWidget {
  UpdateAttendance({Key? key}) : super(key: key);

  var screenWidth, screenHeight;



  @override
  State<UpdateAttendance> createState() => _UpdateAttendanceState();
}

class _UpdateAttendanceState extends State<UpdateAttendance> {
  @override
  Widget build(BuildContext context) {

    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SizedBox()
    );
  }
}

