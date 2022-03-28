import 'package:cloud_firestore/cloud_firestore.dart';
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

  // List<CustomerModel> _customers = <CustomerModel>[];

  @override
  void initState() {
    super.initState();
    // _customers = getEmployeeData();
    getEmployeeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GYMTOGYM'),
      ),
      body: customerList.isEmpty?const CircularProgressIndicator(): SfDataGrid(
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
  } List<CustomerModel> customerList = [];
  getEmployeeData() {
    final collectionRef = FirebaseFirestore.instance.collection('userinfo');
    collectionRef.snapshots().listen((event) {
      customerList = [];
      setState(() {
      });
      event.docs.forEach((element) {
        CustomerModel customerModel = CustomerModel.fromMap(element.data());
        customerList.add(customerModel);
      });
      _customerDetails = CustomerDetailsTable(employees: customerList);
      setState(() {

      });
    });

  }
}


