import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gym2gym_owner/classes/customers_table.dart';
import 'package:gym2gym_owner/main.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../assets/CColors.dart';
import '../models/customer_details_model.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({Key? key}) : super(key: key);

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  late CustomerDetailsTable _customerDetails;

  @override
  void initState() {
    super.initState();
    getEmployeeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('GYMTOGYM'),
        backgroundColor: Colors.transparent,
      ),
      body: customerList.isEmpty
          ? const CircularProgressIndicator()
          : SfDataGrid(
              source: _customerDetails,
              columns: [
                getGridColumn('ID'),
                getGridColumn('Name'),
                getGridColumn('Phone Num'),
                getGridColumn('City'),
                getGridColumn('pkgCode'),
                getGridColumn('Gmail'),
              ],
            ),
    );
  }

  GridColumn getGridColumn(String n) {
    return GridColumn(
      width: screenWidth * .35,
        columnName: n,
        label: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                n,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white),
              ),
            )));
  }

  List<CustomerModel> customerList = [];

  getEmployeeData() {
    final collectionRef = FirebaseFirestore.instance.collection('userinfo');
    collectionRef.snapshots().listen((event) {
      customerList = [];
      setState(() {});
      event.docs.forEach((element) {
        CustomerModel customerModel = CustomerModel.fromMap(element.data());
        customerList.add(customerModel);
      });
      _customerDetails = CustomerDetailsTable(employees: customerList);
      setState(() {});
    });
  }
}
