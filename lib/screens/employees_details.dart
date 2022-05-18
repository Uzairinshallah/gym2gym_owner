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
  var idController= TextEditingController();
  var nameController= TextEditingController();
  var cnicController= TextEditingController();
  var postController= TextEditingController();
  var payController= TextEditingController();

  List<EmpDetailsModel> empDetailsList = [];

  @override
  void initState() {
    super.initState();
    empDetailsList = getEmployeeData();
    _employeeDetails = EmployeeDetailsTable(employees: empDetailsList);
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
      floatingActionButton: FloatingActionButton(
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
        minimumWidth: (kIsWeb) ? screenWidth * .1 : 80,
        columnName: n,
        label: Container(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            alignment: Alignment.centerLeft,
            child: Text(
              n,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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



}



List<EmpDetailsModel> getEmployeeData() {
  return [
    EmpDetailsModel(
      id: '10001',
      name: 'Kathryn',
      Post: 'high',
      CNIC: '1231312313',
      Pay: '131313',
    ),
  ];
}
