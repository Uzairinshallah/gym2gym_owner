import 'package:flutter/material.dart';
import 'package:gym2gym_owner/models/withdraw_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../models/employee_details_model.dart';


class WidthdrawDetailsTable extends DataGridSource {
  WidthdrawDetailsTable({required List<WidthdrawModel> employees}) {
    dataGridRows = employees
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'id', value: dataGridRow.WdID),
      DataGridCell<String>(columnName: 'date', value: dataGridRow.WdDate),
      DataGridCell<String>(
          columnName: 'method', value: dataGridRow.WdMethod),
      DataGridCell<String>(
          columnName: 'status', value: dataGridRow.WdStatus),
      DataGridCell<String>(
          columnName: 'accountNo', value: dataGridRow.WdAccountNo),
      DataGridCell<String>(
          columnName: 'bankName', value: dataGridRow.WdBankName),
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