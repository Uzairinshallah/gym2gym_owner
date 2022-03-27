import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../models/employee_atten_model.dart';

class AttendanceDetails extends DataGridSource {
  AttendanceDetails({required List<EmpAttenModel> employees}) {
    dataGridRows = employees
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell(
                  columnName: 'attendance id',
                  value: dataGridRow.attendance_id),
              DataGridCell(columnName: 'User id', value: dataGridRow.user_id),
              DataGridCell(columnName: 'PKG ID', value: dataGridRow.pkg_id),
              DataGridCell(columnName: 'Date ', value: dataGridRow.date),
              DataGridCell(columnName: 'Charges', value: dataGridRow.charges),
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
