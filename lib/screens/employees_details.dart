import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../classes/employees_table.dart';
import '../main.dart';
import '../models/employee_details_model.dart';

class EmployeesDetailsScreen extends StatefulWidget {
  const EmployeesDetailsScreen({Key? key}) : super(key: key);

  @override
  State<EmployeesDetailsScreen> createState() => _EmployeesDetailsScreenState();
}

class _EmployeesDetailsScreenState extends State<EmployeesDetailsScreen> {

  late EmployeeDetailsTable _employeeDetails;

  List<EmpDetailsModel> _employees = <EmpDetailsModel>[];

  @override
  void initState() {
    super.initState();
    _employees = getEmployeeData();
    _employeeDetails = EmployeeDetailsTable(employees: _employees);
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('GYMTOGYM'),
      ),
      body: SfDataGrid(
        columnWidthMode: ColumnWidthMode.fill,
        source: _employeeDetails,
        columns: [
          getGridColumn('ID'),
          getGridColumn('Name'),
          getGridColumn('CNIC'),
          getGridColumn('Post'),
          getGridColumn('Pay'),

        ],
      ),
    );
  }

  GridColumn getGridColumn(String n) {
    return GridColumn(
        minimumWidth: (kIsWeb) ? screenWidth * .1 : 80,
        columnName: n,
            label: Container(

                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                alignment: Alignment.centerLeft,
                child:  Text(
                  n,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                  overflow: TextOverflow.ellipsis,
                )));
  }
}


List<EmpDetailsModel> getEmployeeData() {
  return [
    EmpDetailsModel('10001', 'James', 'Project Lead', '20000','20000' ),
    EmpDetailsModel('10002', 'Kathryn', 'Manager', '30000' ,'20000'),
    EmpDetailsModel('10003', 'Lara', 'Developer', '15000','20000'),
    EmpDetailsModel('10004', 'Michael', 'Designer', '15000','20000'),
    EmpDetailsModel('10005', 'Martin', 'Developer', '15000','20000'),
    EmpDetailsModel('10006', 'Newberry', 'Developer', '15000','20000'),
    EmpDetailsModel('10007', 'Balnc', 'Developer', '15000','20000'),
    EmpDetailsModel('10008', 'Perry', 'Developer', '15000','20000'),
    EmpDetailsModel('10009', 'Gable', 'Developer', '15000','20000'),
    EmpDetailsModel('10010', 'Grimes', 'Developer', '15000','20000')
  ];
}
