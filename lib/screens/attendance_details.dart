import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  late AttendanceDetails _employeeAttendance;

  List<EmpAttenModel> _employees = <EmpAttenModel>[];

  @override
  void initState() {
    _employees = getEmployeeData();
    _employeeAttendance = AttendanceDetails(employees: _employees);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text('GYMTOGYM'),
        ),
        backgroundColor: CColors.bgColor,
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
              SizedBox(
                height: 0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SfDataGrid(
                    columnWidthMode: ColumnWidthMode.fill,
                    source: _employeeAttendance,
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
        minimumWidth: (kIsWeb) ? screenWidth * .1 : 80,
        columnName: '$colName',
        label: Container(
            // width: 100,
            //   constraints: const BoxConstraints(
            // minWidth: 130,
            // ),
            padding: const EdgeInsets.symmetric(horizontal: 0),
            alignment: Alignment.centerLeft,
            child: Text(
              '$name',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            )));
  }
}

List<EmpAttenModel> getEmployeeData() {
  return [
    EmpAttenModel('10001', 'James', 'Project Lead', '20000', '2000'),
    EmpAttenModel('10002', 'Kathryn', 'Manager', '30000', 'wd'),
    EmpAttenModel('10003', 'Lara', 'Developer', '15000', 'wddw'),
    EmpAttenModel('10004', 'Michael', 'Designer', '15000', 'wef'),
    EmpAttenModel('10005', 'Martin', 'Developer', '15000', 'efwef'),
    EmpAttenModel('10006', 'Newberry', 'Developer', '15000', 'qefwe'),
    EmpAttenModel('10007', 'Balnc', 'Developer', '15000', 'qwdf'),
    EmpAttenModel('10008', 'Perry', 'Developer', '15000', 'wefw'),
    EmpAttenModel('10009', 'Gable', 'Developer', '15000', 'tgr'),
    EmpAttenModel('10010', 'Grimes', 'Developer', '15000', 'egwrf')
  ];
}
