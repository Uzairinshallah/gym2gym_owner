import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerModel{
  late String id;
  late int uid;
  late String name;
  late String phone;
  late String city;
  late String email;
  late Timestamp reg_date;

  CustomerModel({
    required this.id,
    required this.name,
    required this.uid,
    required this.email,
    required this.city,
    required this.phone,
    required this.reg_date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'uid': this.uid,
      'name': this.name,
      'phone': this.phone,
      'reg_date': this.reg_date,
      'phone': this.phone,
      'city': this.city,
    };
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      id: map['id'] as String,
      uid: map['uid'] as int,
      name: map['name'] as String,
      phone: map['phone'] as String,
      reg_date: map['reg_date'] as Timestamp,
      city: map['city'] as String,
      email: map['email'] as String,
    );
  }
}