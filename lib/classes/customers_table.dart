import 'package:flutter/material.dart';
import 'package:gym2gym_owner/models/withdraw_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../models/customer_details_model.dart';
import '../models/employee_details_model.dart';


class CustomerDetailsTable extends DataGridSource {
  CustomerDetailsTable({required List<CustomerModel> employees}) {
    dataGridRows = employees
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'id', value: dataGridRow.id),
      DataGridCell<String>(columnName: 'name', value: dataGridRow.name),
      DataGridCell<String>(
          columnName: 'fname', value: dataGridRow.fname),
      DataGridCell<String>(
          columnName: 'dob', value: dataGridRow.dob),
      DataGridCell<String>(
          columnName: 'day', value: dataGridRow.day),
      DataGridCell<String>(
          columnName: 'pkgCode', value: dataGridRow.pkgCode),
      DataGridCell<String>(
          columnName: 'gymCode', value: dataGridRow.gymCode),
      DataGridCell<String>(
          columnName: 'attendanceTime', value: dataGridRow.attendanceTime),
    ]))
        .toList();
  }

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
          return Container(
              alignment: (dataGridCell.columnName == 'id' ||
                  dataGridCell.columnName == 'salary')
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                dataGridCell.value.toString(),
                overflow: TextOverflow.ellipsis,
              ));
        }).toList());
  }
}