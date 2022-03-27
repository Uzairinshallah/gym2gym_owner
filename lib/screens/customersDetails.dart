import 'package:flutter/material.dart';
import 'package:gym2gym_owner/classes/customers_table.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../models/customer_details_model.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({Key? key}) : super(key: key);

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {

  late CustomerDetailsTable _customerDetails;

  List<CustomerModel> _customers = <CustomerModel>[];

  @override
  void initState() {
    super.initState();
    _customers = getEmployeeData();
    _customerDetails = CustomerDetailsTable(employees: _customers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GYMTOGYM'),
      ),
      body: SfDataGrid(
        source: _customerDetails,
        columns: [

          getGridColumn('ID'),
          getGridColumn('Name'),
          getGridColumn('F_Name'),
          getGridColumn('DOB'),
          getGridColumn('Day'),
          getGridColumn('pkgCode'),
          getGridColumn('gymCode'),
          getGridColumn('attendanceCode'),

        ],
      ),
    );
  }

  GridColumn getGridColumn(String n ) {
    return GridColumn(
            columnName: n,
            label: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerRight,
                child:  Text(
                  n,
                  overflow: TextOverflow.ellipsis,
                )));
  }
}

List<CustomerModel> getEmployeeData() {
  return [
    CustomerModel('10001', 'James', 'Project Lead', '20000','20000','20000','20000','20000'),
    CustomerModel('10002', 'Kathryn', 'Manager', '30000' ,'20000','20000','20000','20000'),
    CustomerModel('10003', 'Lara', 'Developer', '15000','20000','20000','20000','20000'),
    CustomerModel('10004', 'Michael', 'Designer', '15000','20000','20000','20000','20000'),
    CustomerModel('10006', 'Newberry', 'Developer', '15000','20000','20000','20000','20000'),
    CustomerModel('10007', 'Balnc', 'Developer', '15000','20000','20000','20000','20000'),
    CustomerModel('10008', 'Perry', 'Developer', '15000','20000','20000','20000','20000'),
    CustomerModel('10009', 'Gable', 'Developer', '15000','20000','20000','20000','20000'),
    CustomerModel('10010', 'Grimes', 'Developer', '15000','20000','20000','20000','20000')
  ];
}

