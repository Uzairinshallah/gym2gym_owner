import 'package:flutter/material.dart';

import '../assets/CColors.dart';
import '../main.dart';

class AttendanceDetailsScreen extends StatelessWidget {
  const AttendanceDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text('GYMTOGYM'),
        ),
        backgroundColor: CColors.bgColor,
        body: Column(
          children: [
            Container(
              width: screenWidth,
              color: Colors.grey,
              child: const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  'Attendance Details',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
              child: Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      flex:2,
                        child: Container(
                          height: 100,
                      color: Colors.white54,
                          child: Center(child: Text('Total Users',)),
                    )),
                    Container(height: 100, width: 1, color: CColors.bgColor,),
                    Expanded(
                        flex:2,
                        child: Container(
                          height: 100,
                          color: Colors.white54,
                          child: Center(child: Text('Company User')),
                        )),
                    Container(height: 100, width: 1, color: CColors.bgColor,),

                    Expanded(
                        flex:2,
                        child: Container(
                          height: 100,
                          color: Colors.white54,
                          child: Center(child: Text('GTG Users')),
                        )),



                  ],
                ),
              ),
            ),
            Expanded(

              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Table(
                      defaultColumnWidth: FixedColumnWidth(120.0),
                      border: TableBorder.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2),
                      children: [
                        TableRow( children: [
                          Column(children:[Text('Website', style: TextStyle(fontSize: 20.0))]),
                          Column(children:[Text('Tutorial', style: TextStyle(fontSize: 20.0))]),
                          Column(children:[Text('Review', style: TextStyle(fontSize: 20.0))]),
                        ]),
                      ],
                    );
                  }),
            )
          ],
        ));
  }
}
