import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../assets/CColors.dart';
import '../models/employee_details_model.dart';

class EmployeeDetailsTable extends DataGridSource {
  EmployeeDetailsTable({required List<EmpDetailsModel> employees}) {
    dataGridRows = employees
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String>(
                columnName: 'id',
                value: dataGridRow.id,
              ),
              DataGridCell<String>(columnName: 'name', value: dataGridRow.name),
              DataGridCell<String>(columnName: 'CNIC', value: dataGridRow.CNIC),
              DataGridCell<String>(columnName: 'Post', value: dataGridRow.Post),
              DataGridCell<String>(columnName: 'Pay', value: dataGridRow.Pay),
            ]))
        .toList();
  }

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    Color getBackgroundColor() {
      int index = effectiveRows.indexOf(row);
      if (index % 2 == 0) {
        return CColors.buttonOne.withOpacity(.6);
      } else {
        return CColors.buttonOne.withOpacity(.9);
      }
    }
    return DataGridRowAdapter(
        color: getBackgroundColor(),
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Text(
        dataGridCell.value.toString(),
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.white),
      );
    }).toList());
  }
}
