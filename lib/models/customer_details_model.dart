class CustomerModel{
  late String id;
  late String name;
  late String fname;
  late String dob;
  late String day;
  late String pkgCode;
  late String gymCode;
  late String attendanceTime;

  CustomerModel({
    required this.id,
    required this.name,
    required this.fname,
    required this.dob,
    required this.day,
    required this.pkgCode,
    required this.gymCode,
    required this.attendanceTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'fname': this.fname,
      'dob': this.dob,
      'day': this.day,
      'pkgCode': this.pkgCode,
      'gymCode': this.gymCode,
      'attendanceTime': this.attendanceTime,
    };
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      id: map['id'] as String,
      name: map['name'] as String,
      fname: map['fname'] as String,
      dob: map['dob'] as String,
      day: map['day'] as String,
      pkgCode: map['pkgCode'] as String,
      gymCode: map['gymCode'] as String,
      attendanceTime: map['attendanceTime'] as String,
    );
  }
}