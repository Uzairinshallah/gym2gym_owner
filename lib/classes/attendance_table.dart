import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../models/Employee.dart';

class AttendanceDetails extends DataGridSource {
  AttendanceDetails({required List<Employee> employees}) {
    dataGridRows = employees
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell(
                  columnName: 'attendance id',
                  value: Container( width: 110, child: Text(dataGridRow.attendance_id))),
              DataGridCell(
                  columnName: 'User id',
                  value: Container(width: 110, child: Text(dataGridRow.user_id))),
              DataGridCell(
                  columnName: 'PKG ID',
                  value: Container(width: 110, child: Text(dataGridRow.pkg_id))),
              DataGridCell(columnName: 'Date ',
                  value: Container(width: 110, child: Text(dataGridRow.date))),
              DataGridCell(
                  columnName: 'Charges', value: Container(width:110,child: Text(dataGridRow.charges))),
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
