
import 'package:cloud_firestore/cloud_firestore.dart';

class PackagesModel {
  late String pId;
  late String gymId;
  late String name;
  late int packageId;
  late String type;
  late String duration;
  late Timestamp additionDate;
  late int allowedAttendance;
  late int price;
  late int stars;
  late bool status;

  PackagesModel(
      {required this.pId,
      required this.gymId,
      required this.name,
      required this.packageId,
      required this.type,
      required this.duration,
      required this.additionDate,
      required this.allowedAttendance,
      required this.price,
      required this.stars,
      required this.status});

  Map<String, dynamic> toMap() {
    return {
      'pId': this.pId,
      'gymId': this.gymId,
      'name': this.name,
      'packageId': this.packageId,
      'type': this.type,
      'duration': this.duration,
      'additionDate': this.additionDate,
      'allowedAttendance': this.allowedAttendance,
      'price': this.price,
      'stars': this.stars,
      'status': this.status,
    };
  }

  factory PackagesModel.fromMap(Map<String, dynamic> map) {
    return PackagesModel(
      pId: map['pId'] as String,
      gymId: map['gymId'] as String,
      name: map['name'] as String,
      packageId: map['packageId'] as int,
      type: map['type'] as String,
      duration: map['duration'] as String,
      additionDate: map['additionDate'] as Timestamp,
      allowedAttendance: map['allowedAttendance'] as int,
      price: map['price'] as int,
      stars: map['stars'] as int,
      status: map['status'] as bool,
    );
  }
}
