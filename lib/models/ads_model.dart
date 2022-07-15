
class AdsModel{
  late String id;
  late String name;
  late String time;
  List<String> images = [];

  AdsModel({required this.id,required this.name, required this.time,required this.images });
  // Map<String, dynamic> toJson () {
  //   return {
  //     "id": id,
  //     "name": name,
  //     "time": time,
  //     "images": images,
  //
  //   };
  // }


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'time': time,
      'images': images,
    };
  }


  factory AdsModel.fromMap(Map<String, dynamic> map) {
    print(map);
    List images1 = map["images"] ?? [];
    return AdsModel(
      id: map['id'],
      name: map['name'],
      time: map['time'],
      images: List.generate(images1.length, (index) => images1[index]),


    );
  }
}