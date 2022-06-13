import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../assets/CColors.dart';
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
  var idController= TextEditingController();
  var nameController= TextEditingController();
  var cnicController= TextEditingController();
  var postController= TextEditingController();
  var payController= TextEditingController();

  late EmployeeDetailsTable _employeeDetailsTable;

  @override
  void initState() {
    super.initState();
    getEmployeeData();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: CColors.bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('GYMTOGYM'),
        backgroundColor: Colors.transparent,
      ),
      body: employeesList.isEmpty?const CircularProgressIndicator():SfDataGrid(
        columnWidthMode: ColumnWidthMode.fill,
        source: _employeeDetailsTable,
        columns: [
          getGridColumn('ID'),
          getGridColumn('Name'),
          getGridColumn('CNIC'),
          getGridColumn('Post'),
          getGridColumn('Pay'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CColors.buttonOne,
        onPressed: (){
          showDialog(
            context: context,
            builder: (context) => editCategoryBox(),
          );
        },
        child: Icon(Icons.add),
      ),
    );

  }

  GridColumn getGridColumn(String n) {
    return GridColumn(
        width: screenWidth * .35,
        minimumWidth: (kIsWeb) ? screenWidth * .1 : 80,
        columnName: n,
        label: Container(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            alignment: Alignment.centerLeft,
            child: Text(
              n,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              overflow: TextOverflow.ellipsis,
            )));
  }


  Widget editCategoryBox() {
    return AlertDialog(
      title: const Text("Edit Category"),
      content: Column(
        children: [
          getTextField('Id', idController),
          getTextField('Name', nameController),
          getTextField('CNIC', cnicController),
          getTextField('Post', postController),
          getTextField('Pay', payController),

        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          child: Text("Done"),
          onPressed: () async {
            // addEmployee();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  TextFormField getTextField(String hint, TextEditingController controller) {
    return TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: hint,
          ),
        );
  }

  List<EmpDetailsModel> employeesList = [];
  getEmployeeData() {
    final collectionRef = FirebaseFirestore.instance.collection('employees');
    collectionRef.snapshots().listen((event) {
      employeesList = [];
      setState(() {
      });
      event.docs.forEach((element) {
        EmpDetailsModel empDetailsModel = EmpDetailsModel.fromMap(element.data());
        employeesList.add(empDetailsModel);
      });
      _employeeDetailsTable = EmployeeDetailsTable(employees: employeesList);
      setState(() {

      });
    });

  }


}





