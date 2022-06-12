import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gym2gym_owner/main.dart';
import 'package:gym2gym_owner/models/user_model.dart';
import 'package:gym2gym_owner/providers/attendance_provider.dart';
import 'package:provider/provider.dart';

import '../models/employee_atten_model.dart';

class UpdateAttendance extends StatefulWidget {
  UpdateAttendance({Key? key}) : super(key: key);

  var screenWidth, screenHeight;

  @override
  State<UpdateAttendance> createState() => _UpdateAttendanceState();
}

class _UpdateAttendanceState extends State<UpdateAttendance> {
  late UserModel model;

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
          body: ListView.builder(
        itemCount: userModel.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.all(0),
            child: InkWell(
          onTap: () {},
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              child: Stack(children: const [
                Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.greenAccent,
                      child: SizedBox()
                      // Icon(CupertinoIcons.camera),
                      ),
                ),
              ]),
            ),
            title: Text(userModel[index].name.toString()),
            subtitle: Text(userModel[index].name.toString()),
            horizontalTitleGap: 5,
            trailing: ElevatedButton(
              onPressed: (){

              },
              child: Text('Absent'),
            ),
          ),
            ),
          );
        },
      ));
  }

  final _collectionRef = FirebaseFirestore.instance.collection('userinfo');
  List<UserModel> userModel = [];

  Future<void> getData() async {
    await _collectionRef.snapshots().listen((event) {
      userModel = [];
      event.docs.forEach((element) {
        UserModel model = UserModel.fromJson(element.data());
        userModel.add(model);
        print('data set');
      });
      setState(() {});
    });
  }
}
