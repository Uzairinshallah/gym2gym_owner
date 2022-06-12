

class UserModel{
  String? id;
  String? uid;
  String? name;
  String? f_name;
  String? email;
  String? city;
  String? province;
  String? phone;
  String? reg_data;
  String? gender;
  String? district;
  String? area;
  int? subscriptions = 0;



  UserModel({
    required this.id,
    required this.uid,
    required this.name,
    required this.f_name,
    required this.email,
    required this.city,
    required this.province,
    required this.reg_data,
    required this.gender,
    required this.district,
    required this.area,
    required this.phone,
    this.subscriptions = 0,



  });

  UserModel.fromJson(Map<String, dynamic>data ){
    id = data["id"];
    name = data["name"];
    f_name = data["f_name"];
    email = data["email"];
    city = data["city"];
    province = data["province"];
    reg_data = data["reg_date"];
    gender = data["gender"];
    district = data["district"];
    area = data["area"];
    phone = data["phone"];
    subscriptions =  data['subscriptions'] ?? 0;


  }

  Map<String, dynamic>toJson(){
    return{
      "id":id,
      "name":name,
      "f_name":f_name,
      "email": email,
      "city":city,
      "phone":phone,
      "reg_date":reg_data,
      'subscriptions': subscriptions ?? 0,


    };
  }

}