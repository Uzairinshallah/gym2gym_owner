import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../assets/CColors.dart';
import '../classes/attendance_table.dart';
import '../main.dart';
import '../models/Employee.dart';

class AttendanceDetailsScreen extends StatefulWidget {
  AttendanceDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceDetailsScreen> createState() =>
      _AttendanceDetailsScreenState();
}

class _AttendanceDetailsScreenState extends State<AttendanceDetailsScreen> {
  late AttendanceDetails _employeeDataSource;

  List<Employee> _employees = <Employee>[];

  @override
  void initState() {
    _employees = getEmployeeData();
    _employeeDataSource = AttendanceDetails(employees: _employees);
    super.initState();
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
                height: 20,
              ),
              SizedBox(


                child: SfDataGrid(source: _employeeDataSource, columns: [
                  GetGridColumn('Attendance', 'Attendee ID'),
                  GetGridColumn('User', 'User ID'),
                  GetGridColumn('PKG ID', 'PKG ID'),
                  GetGridColumn('Date', 'Date'),
                  GetGridColumn('Charges', 'Charges'),



                  // GridColumn(
                  //     minimumWidth: 110,
                  //     columnName: 'User ',
                  //     label: Container(
                  //         constraints: const BoxConstraints(
                  //           minWidth: 110,
                  //         ),
                  //         padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  //         alignment: Alignment.centerRight,
                  //         child: const Text(
                  //           'user id',
                  //           overflow: TextOverflow.ellipsis,
                  //         ))),
                  // GridColumn(
                  //     minimumWidth: 110,
                  //     columnName: 'PKG Id',
                  //     label: Container(
                  //         constraints: const BoxConstraints(
                  //           minWidth: 110,
                  //         ),
                  //         padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  //         alignment: Alignment.centerLeft,
                  //         child: const Text(
                  //           'package id',
                  //           overflow: TextOverflow.ellipsis,
                  //         ))),
                  // GridColumn(
                  //     minimumWidth: 110,
                  //     columnName: 'Date',
                  //     label: Container(
                  //         constraints: const BoxConstraints(
                  //           minWidth: 110,
                  //         ),
                  //         padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  //         alignment: Alignment.centerLeft,
                  //         child: const Text(
                  //           'date',
                  //           overflow: TextOverflow.ellipsis,
                  //         ))),
                  // GridColumn(
                  //     minimumWidth: 110,
                  //     columnName: 'Charges',
                  //     label: Container(
                  //         constraints: const BoxConstraints(
                  //           minWidth: 110,
                  //         ),
                  //         padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  //         alignment: Alignment.centerRight,
                  //         child: const Text(
                  //           'Charges',
                  //           overflow: TextOverflow.ellipsis,
                  //         )))
                ]),
              )
            ],
          ),
        ));
  }

  GridColumn GetGridColumn(String colName, String name) {
    return GridColumn(
                  minimumWidth: 110,
                  columnName: '$colName',
                  label: Container(
                    // width: 100,
                      constraints: const BoxConstraints(
                        // minWidth: 130,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      alignment: Alignment.centerRight,
                      child: Text(
                        '$name',
                        overflow: TextOverflow.ellipsis,
                      )));
  }
}

List<Employee> getEmployeeData() {
  return [
    Employee('10001', 'James', 'Project Lead', '20000', '2000'),
    Employee('10002', 'Kathryn', 'Manager', '30000', 'wd'),
    Employee('10003', 'Lara', 'Developer', '15000', 'wddw'),
    Employee('10004', 'Michael', 'Designer', '15000', 'wef'),
    Employee('10005', 'Martin', 'Developer', '15000', 'efwef'),
    Employee('10006', 'Newberry', 'Developer', '15000', 'qefwe'),
    Employee('10007', 'Balnc', 'Developer', '15000', 'qwdf'),
    Employee('10008', 'Perry', 'Developer', '15000', 'wefw'),
    Employee('10009', 'Gable', 'Developer', '15000', 'tgr'),
    Employee('10010', 'Grimes', 'Developer', '15000', 'egwrf')
  ];
}
