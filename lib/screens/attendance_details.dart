import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gym2gym_owner/classes/employees_table.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../assets/CColors.dart';
import '../classes/attendance_table.dart';
import '../main.dart';
import '../models/employee_atten_model.dart';

class AttendanceDetailsScreen extends StatefulWidget {
  AttendanceDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceDetailsScreen> createState() =>
      _AttendanceDetailsScreenState();
}

class _AttendanceDetailsScreenState extends State<AttendanceDetailsScreen> {

  late AttendanceDetails _attendanceDetails;

  @override
  void initState() {
    super.initState();
    getEmployeeData();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
        appBar: AppBar(
          title: Text('GYMTOGYM'),
          backgroundColor: Colors.transparent,

        ),
        // backgroundColor: CColors.bgColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: screenWidth,
                color: Colors.grey,
                child: const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    'Attendance Details',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            height: 100,
                            color: Colors.white54,
                            child: Center(
                                child: Text(
                                  'Total Users',
                                )),
                          )),
                      Container(
                        height: 100,
                        width: 1,
                        color: CColors.bgColor,
                      ),
                      Expanded(
                          flex: 2,
                          child: Container(
                            height: 100,
                            color: Colors.white54,
                            child: Center(child: Text('Company User')),
                          )),
                      Container(
                        height: 100,
                        width: 1,
                        color: CColors.bgColor,
                      ),
                      Expanded(
                          flex: 2,
                          child: Container(
                            height: 100,
                            color: Colors.white54,
                            child: Center(child: Text('GTG Users')),
                          )),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: attendaceList.isEmpty?const CircularProgressIndicator(): SfDataGrid(
                    columnWidthMode: ColumnWidthMode.fill,
                    source: _attendanceDetails,
                    columns: [
                      GetGridColumn(
                        'Attendance',
                        'Attendee ID',
                      ),
                      GetGridColumn('User', 'User ID'),
                      GetGridColumn('PKG ID', 'PKG ID'),
                      GetGridColumn('Date', 'Date'),
                      GetGridColumn('Charges', 'Charges'),
                    ]),
              )
            ],
          ),
        ));
  }

  GridColumn GetGridColumn(String colName, String name) {
    return GridColumn(
        width: screenWidth * .35,
        minimumWidth: (kIsWeb) ? screenWidth * .1 : 80,
        columnName: '$colName',
        label: Container(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '$name',
                style: TextStyle(
                ),
                overflow: TextOverflow.ellipsis,
              ),
            )));
  }

  List<EmpAttenModel> attendaceList = [];

  getEmployeeData() {
    final collectionRef = FirebaseFirestore.instance.collection('attendance');
    collectionRef.snapshots().listen((event) {
      attendaceList = [];
      setState(() {});
      event.docs.forEach((element) {
        EmpAttenModel empAttenModel = EmpAttenModel.fromMap(element.data());
        attendaceList.add(empAttenModel);
      });
      _attendanceDetails = AttendanceDetails(employees: attendaceList);
      setState(() {

      });
    });
  }

}
