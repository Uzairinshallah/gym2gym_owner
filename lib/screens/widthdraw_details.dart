import 'package:flutter/material.dart';
import 'package:gym2gym_owner/classes/widthdraw_table.dart';
import 'package:gym2gym_owner/models/withdraw_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class WidthdrawDetails extends StatefulWidget {
  const WidthdrawDetails({Key? key}) : super(key: key);

  @override
  _WidthdrawDetailsState createState() => _WidthdrawDetailsState();
}

class _WidthdrawDetailsState extends State<WidthdrawDetails> {

  late WidthdrawDetailsTable _widthdrawDetails;

  List<WidthdrawModel> _employees = <WidthdrawModel>[];

  @override
  void initState() {
    super.initState();
    _employees = getEmployeeData();
    _widthdrawDetails = WidthdrawDetailsTable(employees: _employees);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfDataGrid(
        source: _widthdrawDetails,
        columns: [
          GridColumn(
              columnName: 'id',
              label: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerRight,
                  child: const Text(
                    'ID',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'date',
              label: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'date',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'method',
              label: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'method',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'status',
              label: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerRight,
                  child: Text(
                    'status',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'accountNo',
              label: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerRight,
                  child: Text(
                    'accountNo',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'bankName',
              label: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerRight,
                  child: Text(
                    'bankName',
                    overflow: TextOverflow.ellipsis,
                  ))),
        ],
      ),
    );
  }
}

List<WidthdrawModel> getEmployeeData() {
  return [
    WidthdrawModel('10001', 'James', 'Project Lead', '20000','20000','20000'),
    WidthdrawModel('10002', 'Kathryn', 'Manager', '30000' ,'20000','20000'),
    WidthdrawModel('10003', 'Lara', 'Developer', '15000','20000','20000'),
    WidthdrawModel('10004', 'Michael', 'Designer', '15000','20000','20000'),
    WidthdrawModel('10005', 'Martin', 'Developer', '15000','20000','20000'),
    WidthdrawModel('10006', 'Newberry', 'Developer', '15000','20000','20000'),
    WidthdrawModel('10007', 'Balnc', 'Developer', '15000','20000','20000'),
    WidthdrawModel('10008', 'Perry', 'Developer', '15000','20000','20000'),
    WidthdrawModel('10009', 'Gable', 'Developer', '15000','20000','20000'),
    WidthdrawModel('10010', 'Grimes', 'Developer', '15000','20000','20000')
  ];
}
