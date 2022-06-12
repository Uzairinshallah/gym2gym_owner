import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../models/customer_details_model.dart';

class CustomerDetailsTable extends DataGridSource {
  CustomerDetailsTable({required List<CustomerModel> employees}) {
    dataGridRows = employees
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'id', value: dataGridRow.id),
              // DataGridCell<String>(columnName: 'uid', value: dataGridRow.uid.toString()),
              DataGridCell<String>(columnName: 'name', value: dataGridRow.name),
              DataGridCell<String>(
                  columnName: 'phone', value: dataGridRow.phone),
              DataGridCell<String>(columnName: 'city', value: dataGridRow.city),
              DataGridCell<String>(
                  columnName: 'reg_date',
                  value: dataGridRow.reg_date.toString()),
              DataGridCell<String>(
                  columnName: 'email', value: dataGridRow.email),
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
          alignment : Alignment.centerLeft,
          // padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12),
          ));
    }).toList());
  }
}
