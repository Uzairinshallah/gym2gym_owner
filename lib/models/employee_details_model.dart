class EmpDetailsModel {
  // EmpDetailsModel(this.id, this.name, this.CNIC, this.Post, this.Pay,);
  final String id;
  final String name;
  final String CNIC;
  final String Post;
  final String Pay;

  EmpDetailsModel({required this.id, required this.name, required this.CNIC, required this.Post, required this.Pay});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'CNIC': this.CNIC,
      'Post': this.Post,
      'Pay': this.Pay,
    };
  }

  factory EmpDetailsModel.fromMap(Map<String, dynamic> map) {
    return EmpDetailsModel(
      id: map['id'],
      name: map['name'],
      CNIC: map['CNIC'],
      Post: map['Post'],
      Pay: map['Pay'],
    );
  }
}