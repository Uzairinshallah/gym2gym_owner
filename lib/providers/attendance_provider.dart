

import 'package:flutter/material.dart';

class AttendanceProvider with ChangeNotifier{

  AttendanceProvider(){

  }

  bool selectDate = false;
  DateTime? reg_date ;


  checkDate(bool check){
    selectDate = check;
    notifyListeners();
  }



}