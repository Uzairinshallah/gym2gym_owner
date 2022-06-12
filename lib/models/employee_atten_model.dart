import 'package:cloud_firestore/cloud_firestore.dart';

class EmpAttenModel {
  final String attendance_id;
  final String user_id;
  final String pkg_id;
  final Timestamp date;
  final String charges;


  EmpAttenModel(
      {required this.attendance_id,required this.user_id,required this.pkg_id,required this.date,required this.charges});

  Map<String, dynamic> toMap() {
    return {
      'attendance_id': this.attendance_id,
      'user_id': this.user_id,
      'pkg_id': this.pkg_id,
      'date': this.date,
      'charges': this.charges,
    };
  }

  factory EmpAttenModel.fromMap(Map<String, dynamic> map) {
    return EmpAttenModel(
      attendance_id: map['atten_id'] as String,
      user_id: map['uid'] as String,
      pkg_id: map['pkg_id'] as String,
      date: map['date'] as Timestamp,
      charges: map['charges'] as String,
    );
  }
}
